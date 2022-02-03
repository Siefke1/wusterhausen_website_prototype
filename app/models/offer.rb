class Offer < ApplicationRecord
  enum status: {inactive: 0, active: 1, cancelled: 2}
  belongs_to :user
  has_many :category_offers, dependent: :destroy
  has_many :categories, :through => :category_offers
  # accepts_nested_attributes_for :categories, reject_if: blank?, allow_destroy: false
  # accepts_nested_attributes_for :category_offers, allow_destroy: true

  validates :title, :description, :about_us, :email, :postcode, presence: true
end
