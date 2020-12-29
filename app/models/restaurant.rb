class Restaurant < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    include Filterable

    # Validations
    before_validation { self.state = self.state.upcase }

    validates :name, presence: true, uniqueness:true
    validates :city, presence: true
    validates :state, presence: true, inclusion: { in: US_STATES,
        message: "%{value} is not a valid US state" }
    # validates :dine_in, inclusion: { in: [true, false] , message: "%{value} must be true or false"}
    # validates :take_out, inclusion: { in: [true, false] }
    # validates :must
    # validates :is_dining_method, message: "Please adjust confirm at least one method of dining"

    def is_dining_method
        binding.pry
        if :dining_in || :take_out
        #   errors.add(:expiration_date, "can't be in the past")
        end
    end
    scope :filter_alpha_z, -> { order(name: :desc) }
    scope :filter_alpha_a, -> { order(name: :asc) }
    scope :filter_dine_in, -> { where(dine_in: true) }
    scope :filter_take_out, -> { where(take_out: true) }
    scope :filter_by_restaurant, -> (s="") { where("NAME like ?", "%#{s}%") } 

    # scope :filter_by_state, -> (s="NY") { where("STATE = ?", s) } 
    
    def total_rating
        total = 0.0
        self.reviews.each {|r|
            total = total + r.rating
        }
        total
    end
    def avg_rating
        if total_rating == 0
            return "Not Rated Yet"
        else
            return "#{(total_rating/self.reviews.size).round(2)} stars"
        end
    end
    
end
