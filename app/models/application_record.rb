class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def located 
    if (self.city != "" && self.city != nil) && (self.state != "" && self.state != nil)
      "Located: #{self.city} #{self.state}"
    end
  end
end
