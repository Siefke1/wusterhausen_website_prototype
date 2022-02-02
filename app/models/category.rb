class Category < ApplicationRecord
  belongs_to :topic
  has_many :category_offers
  has_many :offers, :through => :category_offers
  validates :title, presence: true
end
