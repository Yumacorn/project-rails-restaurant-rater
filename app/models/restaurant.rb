class Restaurant < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews

    # Validations
    before_validation { self.state = self.state.upcase }

    validates :name, presence: true, uniqueness:true
    validates :city, presence: true
    validates :state, presence: true, inclusion: { in: US_STATES,
        message: "%{value} is not a valid US state" }
    validates :dine_in, inclusion: { in: [true, false] , message: "%{value} must be true or false"}
    validates :take_out, inclusion: { in: [true, false] }

    scope :alpha_z, -> { order(name: :desc) }
    scope :alpha_a, -> { order(name: :asc) }
    
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
