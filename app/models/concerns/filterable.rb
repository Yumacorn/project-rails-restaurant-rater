module Filterable
    extend ActiveSupport::Concern
  
    module ClassMethods
      def filter(filtering_params, object)
        binding.pry
        results = self.where(nil)
        if filtering_params[object].present?
          binding.pry
            filtering_params[object].each do |key, value|
              binding.pry
                # [2] pry(Restaurant)> filtering_params[object]
                # => <ActionController::Parameters {"filter_by_state"=>"NY"} permitted: false>
                results = results.public_send("#{key}", value) if value.present?
                # [1] pry(Restaurant)> key
                # => "filter_by_state"    
                # [2] pry(Restaurant)> value
                # => "FL"
            end
        elsif filtering_params["search"].present?
          binding.pry
          # results = Restaurant.filter_by_restaurant(filtering_params["search"])
          filtering_params["search"].each do |key, value|
            binding.pry
            results = results.public_send("#{key}", value)
          end
        end
        results
      end
    end
  end