class ReviewsController < ApplicationController
    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @reviews = @user.reviews
        else
            @reviews = Review.all
        end
    end

    def show
        @review = Review.find(params[:id])
    end

    def new
        @review = Review.new
    end

    def create
        @review = Review.create(review_params)
        if @review.save
            redirect_to review_path(@review)
        else
            render :new
        end      
    end

    def edit
        @review = Review.find(params[:id])
    end

    def update
        @review = Review.find(params[:id])
        @review.update(review_params)
        redirect_to review_path(@review)
    end

    def destroy
        Review.find(params[:id]).destroy
        redirect_to reviews_path
    end

    private
    def review_params
        params.require(:review).permit(:user_id, :restaurant_id, :rating, :dining_method, :comment)
    end
end
