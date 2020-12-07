class RestaurantsController < ApplicationController
    def index
        @restaurants = Restaurant.all
    end

    def show
        @restaurant = Restaurant.find(params[:id])
    end

    private
    def restaurant_params
        params.require(:restaurant).permit(:name, :city, :state, :dine_in, :take_out)
    end
end
