class User < ApplicationRecord
    has_many :reviews
    has_many :restaurants, through: :reviews
    
    US_STATES = %w(AL AK AS AZ AR CA CO CT DE DC FM FL GA GU HI ID IL IN IA KS KY LA ME MH MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND MP OH OK OR PW PA PR RI SC SD TN TX UT VT VI VA WA WV WI WY)

    # Validations
    before_validation { self.state = self.state.upcase }

    validates :name, presence: true
    validates :username, presence: true, uniqueness: true
    validates :age, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 99} 
    validates :city, presence: true
    validates :state, presence: true, inclusion: { in: US_STATES,
        message: "%{value} is not a valid US state" }
end
