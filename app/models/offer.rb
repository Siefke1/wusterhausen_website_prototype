class Offer < ApplicationRecord
  belongs_to :user
  has_many :categories, through: :offers_categories
  validates :title, :description, :about_us, :email, :postcode, presence: true
end
