class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        # @user = User.new(user_params(:name, :username, :email, :password, :city, :state, :age))
        @user = User.new(user_params)
        @user.save
        redirect_to user_path(@user)
    end

    def update
        @user = User.find(params[:id])
        # @user.update(user_params(:name, :username, :email, :password, :city, :state, :age))
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
        redirect_to user_path(@user)
    end

    private
    
    def user_params
        params.require(:user).permit(:name, :username, :email, :password, :city, :state, :age)
    end
end
