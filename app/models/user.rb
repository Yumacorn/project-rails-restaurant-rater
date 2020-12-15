class User < ApplicationRecord
    has_many :reviews
    has_many :restaurants, through: :reviews
    has_secure_password
    
    # Validations

    before_validation {
      if self.state
       self.state = self.state.upcase
      end 
      }

    validates :name, presence: true
    validates :username, presence: true, uniqueness: true
    validates :age, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 99}
    validates :city, presence: true
    validates :state, presence: true, inclusion: { in: US_STATES, message: "%{value} is not a valid US state" }

    def self.from_omniauth(auth)
      #if github, this is how to pull username request.env['omniauth.auth']['info']['nickname']
      #elsif google, this is how to pull email request.env['omniauth.auth']['info']['email']
      #else pull from developer strategy, name request.env['omniauth.auth']['info']['name']
      if auth.provider == "github"
        where(username: auth.info.nickname).first_or_initialize do |user|
          user.username = auth.info.nickname
          # user.password = SecureRandom.hex
          user.password = 'Fix'
          user.age = 28
          user.city = 'Syosset'
          user.state = 'NY'
        end
      elsif auth.provider == "google_oauth2"
        where(username: auth.info.email).first_or_initialize do |user|
          user.username = auth.info.email
          user.name = auth.info.name
          user.password = 'Fix'
          user.age = 32
          user.city = 'Melville'
          user.state = 'NY'
        end
      elsif auth.provider == "developer"
        where(username: auth.info.email).first_or_initialize do |user|
          user.username = auth.info.email
          user.name = auth.info.name
          user.password = 'Fix'
          user.age = 50
          user.city = 'Stony Brook'
          user.state = 'NY'
        end
      end
    end   
end
