class SessionsController < ApplicationController
  # before_action :require_login
  # skip_before_action :require_login, only: [:index]
  skip_before_action :verify_authenticity_token, only: :create
   
  def create
    if request.env["omniauth.auth"]
      @user = User.from_omniauth(auth)
      binding.pry
      if @user.save
        session[:user_id] = @user.id
        redirect_to '/'
      else
        render 'new'
      end
    else # user login via non omniauth
      @user = User.find_by(username: params[:username])
      if @user
        authenticated = @user.try(:authenticate, params[:password])
        # return head(:forbidden) unless authenticated
        if authenticated
          session[:user_id] = @user.id
          redirect_to '/'
        end
      else
        render 'new'
      end
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
