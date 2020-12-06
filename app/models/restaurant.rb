class Restaurant < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews

    # Validations
    validates :name, presence: true
    validates :username, presence: true, uniqueness: true
    validates :age, presence: true
    validates :city, presence: true
    validates :state, presence: true
end
