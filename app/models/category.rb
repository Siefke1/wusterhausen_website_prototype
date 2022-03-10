class Category < ApplicationRecord
  belongs_to :topic
  has_many :category_offers, dependent: :destroy
  has_many :offers, :through => :category_offers
  validates :title, presence: true
  has_one_attached :photo

  # SCOPES
  scope :topic_one, -> { where(topic_id: 1) }
  scope :topic_two, -> { where(topic_id: 2) }
  scope :topic_three, -> { where(topic_id: 3) }
  scope :topic_four, -> { where(topic_id: 4) }
end
