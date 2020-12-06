class User < ApplicationRecord
    has_many :reviews
    has_many :restaurants, through: :reviews
        
    # Validations
    validates :name, presence: true
    validates :username, presence: true, uniqueness: true

end
