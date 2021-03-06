class Offer < ApplicationRecord
  geocoded_by :postcode_german
  after_validation :geocode, if: :will_save_change_to_postcode?
  enum status: {inactive: 0, active: 1, cancelled: 2}
  belongs_to :user
  has_many :category_offers, dependent: :destroy
  has_many :categories, :through => :category_offers

  # Cloudinary
  has_one_attached :photo

  # Validations
  validates :title, :description, :about_us, :email, :postcode, :category_ids, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_title,
    against: [ :title ],
    using: {
      tsearch: { prefix: true }
    }

  # Get full address
  def full_address
    [address, town, postcode].compact.join(", ")
  end

  # Get correct Postcode for geocoder
  def postcode_german
    "#{postcode}, Deutschland"
  end
end
