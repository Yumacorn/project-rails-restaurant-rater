class ReviewsController < ApplicationController
    #before_action for "set review" show/update/edit/destroy
    #make new branch for comments/working - make master clean
    

    def index
        # binding.pry
        # if params[:user_id] && @user = User.find_by_id(params[:user_id])
        #     @reviews = @user.reviews
        # elsif params[:restaurant_id] && @restaurant = Restaurant.find_by_id(params[:restaurant_id])
        #     @reviews = @restaurant.reviews
        #     # @user = User.find_by_id(params[:reviews][:filter_by_user]) if params[:reviews][:filter_by_user]
        # else
        #     @reviews = Review.filter(params, "reviews")
        # end
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @reviews = @user.reviews
        elsif params[:restaurant_id] && @restaurant = Restaurant.find_by_id(params[:restaurant_id])
            @reviews = @restaurant.reviews
            # @user = User.find_by_id(params[:reviews][:filter_by_user]) if params[:reviews][:filter_by_user]
        end
        @reviews = Review.filter(params, "reviews")
    end

    def show
        @review = Review.find(params[:id])
    end

    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @review = @user.reviews.build
        else
            @review = Review.new
        end
    end

    def create
        @review = User.find(current_user).reviews.build(review_params)
        # current_user rather than use it the id
        if @review.save
            redirect_to review_path(@review)
            #HTTP request - stateless, not sending a new requst
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
