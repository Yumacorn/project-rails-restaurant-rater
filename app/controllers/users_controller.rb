class UsersController < ApplicationController
    before_action :authentication_required, except: [:new, :create]

    def index
        @users = User.filter(params, "users")
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    
    private
    
    def user_params
        params.require(:user).permit(:name, :username, :email, :password, :city, :state, :age)
    end
end
