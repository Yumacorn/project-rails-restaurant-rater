class SessionsController < ApplicationController
  # before_action :require_login
  # skip_before_action :require_login, only: [:index]

  def new
    @user = User.new
  end
  
  def create
    binding.pry
    user_info = request.env['omniauth.auth']

    session[:username] = params[:username]
    redirect_to '/'

    user = User.find_by(username: params[:username])
    authenticated = user.try(:authenticate, params[:password])
    return head(:forbidden) unless authenticated
    @user = user
    session[:user_id] = @user.id
  end

  def destroy
    binding.pry
    session.delete :username
  end

  def omniauth
    binding.pry

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
