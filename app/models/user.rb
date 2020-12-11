class User < ApplicationRecord
    has_many :reviews
    has_many :restaurants, through: :reviews
    has_secure_password
    

    # Validations
    before_validation { self.state = self.state.upcase }

    validates :name, presence: true
    validates :username, presence: true, uniqueness: true
    validates :age, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 99} 
    validates :city, presence: true
    validates :state, presence: true, inclusion: { in: US_STATES,
        message: "%{value} is not a valid US state" }

    # def self.from_omniauth(auth)
    #     where(email: auth.info.email).first_or_initialize do |user|
    #         user.username = auth.info.name
    #         user.password = SecureRandom.hex
    #     end
    # end

    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
          user.user_name = auth.info.name
          user.email = auth.info.email
          user.password = SecureRandom.hex
        end
      end
end
