class User < ApplicationRecord
    has_many :reviews
    has_many :restaurants, through: :reviews
        
    # Validations
    validates :name, presence: true
    validates :username, presence: true, uniqueness: true
    validates :age, inclusion: { in: %w(0-99), message: "%{value} must be between 0-99"},
        # presence: true, 
        # format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
        numericality: true 
end
