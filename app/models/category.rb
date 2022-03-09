class Category < ApplicationRecord

  # Associations
  belongs_to :topic
  has_many :category_offers, dependent: :destroy
  has_many :offers, through: :category_offers
  has_one_attached :photo

  # Validations
  validates :title, presence: true
  validates :title, uniqueness: true

end
