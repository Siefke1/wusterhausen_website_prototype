class Category < ApplicationRecord
  belongs_to :topic
  has_many :offers, through: :offers_categories
  validates :title, presence: true
end
