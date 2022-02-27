class Article < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :content, :title, presence: true
end
