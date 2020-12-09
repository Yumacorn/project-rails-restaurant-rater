class SessionsController < ApplicationController
  # skip_before_action :verify_authenticity_token, only: :create

  def new
    @user = User.new
  end

  def create
    binding.pry
    if @user.save && params[:user][:password] == params[:user][:password_confirmation]
      session[:user_id] = @user.id
      redirect_to users_path(@user)
    else
        redirect_to new_user_path
    end
    @user = User.find_by(username: params[:username])
    return head(:forbidden) unless @user.authenticate(params[:password])
    session[:user_id] = @user.id
    # render 'sessions/welcome'
  end
  
  # def create
  #   @user = User.find_or_create_from_auth_hash(auth_hash)
  #   self.current_user = @user
  #   redirect_to '/'
  # end

  # protected

  # def auth_hash
  #   request.env['omniauth.auth']
  # end

  def destroy
    session.delete :username
  end
end
