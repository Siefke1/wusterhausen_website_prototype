class Article < ApplicationRecord

  # Associations
  belongs_to :user
  has_one_attached :photo

  # Validations
  validates :content, :title, presence: true
end
