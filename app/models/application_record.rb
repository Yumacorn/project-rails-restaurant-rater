class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :filter_by_state, -> (s="NY") { where("STATE = ?", s) } 

  #move out of application_record to model/concerns
  def located 
    if (self.city != "" && self.city != nil) && (self.state != "" && self.state != nil)
      "Located: #{self.city} #{self.state}"
    end
  end

  def self.available_states
    self.group(:state)
  end

  def self.available_users
    self.joins(:user).group(:name).count.keys
    #preserve the scope as a chainable call
    #rails guide query, active_record
  end
end
