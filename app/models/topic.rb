class Topic < ApplicationRecord
  has_many :categories
  validates :title, presence: true
end
