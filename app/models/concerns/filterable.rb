module Filterable
    extend ActiveSupport::Concern
  
    module ClassMethods
      def filter(filtering_params, object)
        results = self.where(nil)
        if filtering_params[object].present?
            filtering_params[object].each do |key, value|
                # [2] pry(Restaurant)> filtering_params[object]
                # => <ActionController::Parameters {"filter_by_state"=>"NY"} permitted: false>
                results = results.public_send("#{key}", value) if value.present?
                # [1] pry(Restaurant)> key
                # => "filter_by_state"    
                # [2] pry(Restaurant)> value
                # => "FL"
            end
        elsif filtering_params["search"].present?
          # results = Restaurant.filter_by_restaurant(filtering_params["search"])
          filtering_params["search"].each do |key, value|
            results = results.public_send("#{key}", value)
          end
        end
        results
      end
    end
  end