class SessionsController < ApplicationController
  # before_action :require_login
  # skip_before_action :require_login, only: [:index]
  skip_before_action :verify_authenticity_token, only: :create
   
  def create
    pp request.env['omniauth.auth']
    session[:user_id] = auth['uid']
    @user = User.from_omniauth(auth)
    if @user.save
      session[:user_id] = @user.id
    else
    end
    redirect_to '/'

    # user = User.find_by(username: params[:username])
    # authenticated = user.try(:authenticate, params[:password])
    # return head(:forbidden) unless authenticated
    # @user = user
    # session[:user_id] = @user.id
  end

  # def destroy
  #   binding.pry
  #   session.delete :username
  # end

  def omniauth
    @user = User.from_omniauth(auth)
    @user.save
    session[:user_id] = @user.id
    redirect_to home_path
  end
  
  private

  def auth
    request.env['omniauth.auth']
  end
end
