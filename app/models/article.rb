class Article < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :content, :title, presence: true
  enum :status, { inactive: 0, active: 1, archived: 2 }
end
