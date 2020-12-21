module Filterable
    extend ActiveSupport::Concern
  
    module ClassMethods
      def filter(filtering_params, object)
        results = self.where(nil)
        if filtering_params[object].present?
            filtering_params[object].each do |key, value|
                results = results.public_send("#{key}", value) if value.present?
            end
        end
        results
      end
    end
  end