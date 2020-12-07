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
end
