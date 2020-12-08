class SessionsController < ApplicationController
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
  end
  
  def destroy
    session.delete :username
  end
end
