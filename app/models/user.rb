class User < ApplicationRecord
    has_many :reviews
    has_many :restaurants, through: :reviews
    has_secure_password
    
    include Filterable

    # Validations

    before_validation {
      if self.state
       self.state = self.state.upcase
      end 
      }

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
    validates :age, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 99}, allow_nil: true
    # validates :city, presence: true
    validates :state, inclusion: { in: US_STATES, message: "%{value} is not a valid US state" }, allow_blank: true
    
    def self.from_omniauth(auth)
      #if github, this is how to pull username request.env['omniauth.auth']['info']['nickname']
      #elsif google, this is how to pull email request.env['omniauth.auth']['info']['email']
      if auth.provider == "github"
        where(username: auth.info.nickname).first_or_initialize do |user|
          user.email = auth.info.email
          user.password = SecureRandom.hex(10)
          user.name = auth.info.name
          user.username = auth.info.nickname
        end
      elsif auth.provider == "google_oauth2"
        where(username: auth.info.email).first_or_initialize do |user|
          user.email = auth.info.email
          user.password = SecureRandom.hex(10)
          user.name = auth.info.name
          user.username = auth.info.email
        end
      end
    end   
end
