class SessionsController < ApplicationController
  # before_action :require_login
  # skip_before_action :require_login, only: [:index]
  skip_before_action :verify_authenticity_token, only: :create
   
  def create
    if request.env["omniauth.auth"]
      pp request.env['omniauth.auth']
      @user = User.from_omniauth(auth)
      if @user.save
        session[:user_id] = @user.id
      end
    else
      # user login via non omniauth
      user = User.find_by(username: params[:username])
      authenticated = user.try(:authenticate, params[:password])
      return head(:forbidden) unless authenticated
      @user = user
      session[:user_id] = @user.id
    end
    redirect_to '/'
  end

  def destroy
    binding.pry
    reset_session
    session[:user_id] = nil
    session.delete :username
    redirect_to '/'
  end

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
