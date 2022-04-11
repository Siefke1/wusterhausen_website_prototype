class Article < ApplicationRecord

  # Associations
  belongs_to :user
  has_one_attached :photo

  # Validations
  validates :content, :title, presence: true

  # Search for admin dashboard
  include PgSearch::Model
  pg_search_scope :search_by_title,
    against: [ :title ],
    using: {
      tsearch: { prefix: true }
    }
end
