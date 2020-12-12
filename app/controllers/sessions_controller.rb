class SessionsController < ApplicationController
  # before_action :require_login
  # skip_before_action :require_login, only: [:index]
  skip_before_action :verify_authenticity_token, only: :create

  # def new
  #   @user = User.new
  # end
  
  def create
    pp request.env['omniauth.auth']
    binding.pry
    session[:name] = request.env['omniauth.auth']['info']['name'] || request.env['omniauth.auth']['info']['nickname']
    session[:omniauth_data] = request.env['omniauth.auth']
    redirect_to root_path
    # @user = User.find_or_create_from_auth_hash(auth_hash)
    # self.current_user = @user
    # redirect_to '/'

    # user_info = request.env['omniauth.auth']

    # session[:username] = params[:username]
    # redirect_to '/'

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

  # def omniauth
  #   binding.pry

  #   @user = User.from_omniauth(auth)
  #   @user.save
  #   session[:user_id] = @user.id
  #   redirect_to home_path
  # end
  
  # private

  # def auth_hash
  #   request.env['omniauth.auth']
  # end
end
