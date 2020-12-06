class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  # Validations
  validates :user, presence: true
  validates :restaurant, presence: true
  validates :rating, presence: true, inclusion: {in: 1..5}
  validates :dining_method, presence: true, inclusion: {in: ["Dine In", "Take Out"],
    not_choice: "Please adjust %{attribute} so it reflects the type of dining:Dine In, Take Out"}
  validates :comment, presence: true, length: { maximum: 50,
    too_long: "%{count} characters is the maximum allowed" }
end
