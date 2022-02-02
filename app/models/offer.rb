class Offer < ApplicationRecord
  enum status: {inactive: 0, active: 1, cancelled: 2}
  belongs_to :user
  has_many :category_offers
  has_many :categories, :through => :category_offers

  validates :title, :description, :about_us, :email, :postcode, presence: true
end
