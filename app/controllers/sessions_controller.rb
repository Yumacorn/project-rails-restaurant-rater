class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create
   
  def create
    if request.env["omniauth.auth"]
      @user = User.from_omniauth(auth)
      if @user.save
        session[:user_id] = @user.id
        redirect_to '/'
      else
        @error = "That email/password is not valid"
        render 'new'
      end
    else # user login via non omniauth
      @user = User.find_by(email: params[:email])
      if @user
        authenticated = @user.try(:authenticate, params[:password])
        if authenticated
          session[:user_id] = @user.id
          redirect_to '/'
        else
          @error = "That email/password is not valid"
          render 'new'
        end
      end
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end
  
  private

  def auth
    request.env['omniauth.auth']
  end
end
