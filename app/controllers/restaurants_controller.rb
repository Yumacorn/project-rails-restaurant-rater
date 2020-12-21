class RestaurantsController < ApplicationController
    def index
        @restaurants = Restaurant.all
        if params[:state].present?
            @restaurants = @restaurant.state(params[:state])
        end
        # case params[:scope]  
        # when "state"
        #   if (params[:format] == "7")
        #     @jobs = Job.by_num_days_past("7")
        #   elsif (params[:format] == "30")
        #     @jobs = Job.by_num_days_past("30")
        #   elsif (params[:format] == "60")
        #     @jobs = Job.by_num_days_past("60")
        #   else
        #     @jobs = Job.all
        #   end 
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
        params.require(:restaurant).permit(:name, :city, :state, :dine_in, :take_out)
    end
end
