module Filterable
    extend ActiveSupport::Concern
  
    module ClassMethods
      def filter(filtering_params, object)
        binding.pry
        results = self.where(nil)
        if filtering_params[object].present?
          binding.pry
            filtering_params[object].each do |key, value|
                results = results.public_send("#{key}", value) if value.present?
            end
        elsif filtering_params["search"].present?
          results = Restaurant.filter_by_restaurant(filtering_params["search"])
        end
        results
      end
    end
  end