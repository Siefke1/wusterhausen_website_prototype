class Topic < ApplicationRecord

  # Associations
  has_many :categories
  validates :title, presence: true
end
