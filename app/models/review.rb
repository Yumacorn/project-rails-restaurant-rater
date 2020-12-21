class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  include Filterable


  scope :filter_by_user, -> (u="") { where("ID = ?", u) } 

  # Validations
  validates :user, presence: true
  validates :restaurant, presence: true
  validates :rating, presence: true, inclusion: {in: 1..5}
  validates :dining_method, presence: true, inclusion: {in: ["Dine In", "Take Out"],
    not_choice: "Please adjust %{attribute} so it reflects the type of dining:Dine In, Take Out"}
  validates :comment, length: { maximum: 200,
    too_long: "%{count} characters is the maximum allowed" }

  def name_of_user
    User.find(user_id).name
  end
end
