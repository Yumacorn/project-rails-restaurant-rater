class Review < ApplicationRecord
  belongs_to :user_id
  belongs_to :restaurant_id
end
