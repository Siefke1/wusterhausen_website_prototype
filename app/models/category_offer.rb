class CategoryOffer < ApplicationRecord
  belongs_to :category
  belongs_to :offer, dependent: :destroy
  #accepts_nested_attributes_for :category, reject_if: all_blank
end
