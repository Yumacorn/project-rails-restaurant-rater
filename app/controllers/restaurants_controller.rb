class RestaurantsController < ApplicationController
    def index
        @restaurants = Restaurant.all
        if params[:restaurants] && params[:restaurants][:filter_by_state].present?
            @restaurants = @restaurants.filter_by_state(params[:restaurants][:filter_by_state])
            render 'index'
        end
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
        binding.pry
        params.require(:restaurant).permit(:name, :city, :state, :dine_in, :take_out, :filter_by_state)
    end
end
