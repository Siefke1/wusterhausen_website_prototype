class Offer < ApplicationRecord
  belongs_to :user
  has_many :categories, through: :offers_categories
end
