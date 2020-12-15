class SessionsController < ApplicationController
  # before_action :require_login
  # skip_before_action :require_login, only: [:index]
  skip_before_action :verify_authenticity_token, only: :create
   
  def create
    if request.env["omniauth.auth"]
      pp request.env['omniauth.auth']
      @user = User.from_omniauth(auth)
    else
      # user login via non omniauth
      @user = User.find_by(username: params[:username])
      authenticated = @user.try(:authenticate, params[:password])
      # return head(:forbidden) unless authenticated
      render 'new' unless authenticated
    end
    if @user.save
      binding.pry

      session[:user_id] = @user.id
      redirect_to '/'
    end
  end

  def destroy
    reset_session
    redirect_to login_path
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
