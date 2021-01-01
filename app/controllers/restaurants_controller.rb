class RestaurantsController < ApplicationController
    def index
        if params["search"]
            # binding.pry # @restaurants
        end
        @restaurants = Restaurant.filter(params, "restaurants")
    end

    def show
        @restaurant = Restaurant.find(params[:id])
    end

    def new
        @restaurant = Restaurant.new
    end

    def create
        @restaurant = Restaurant.new(restaurant_params)
        if @restaurant.save
            redirect_to restaurant_path(@restaurant)
        else
            render 'new'
        end
    end

    def edit
        @restaurant = Restaurant.find(params[:id])
    end

    def update
        @restaurant = Restaurant.find(params[:id])
        @restaurant.update(restaurant_params)
        redirect_to restaurant_path(@restaurant)
    end

    private
    def restaurant_params
        params.require(:restaurant).permit(:name, :city, :state, :dine_in, :take_out, :filter_by_state)
    end
end
