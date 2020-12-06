class User < ApplicationRecord
    has_many :reviews
    has_many :restaurants, through: :reviews
        
    # Validations
    validates :name, presence: true
    validates :username, presence: true, uniqueness: true
    validates :age, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 99} 
    validates :city, presence: true
    validates :state, presence: true    
end
