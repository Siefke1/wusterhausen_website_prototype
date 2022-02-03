class CategoryOffer < ApplicationRecord
  belongs_to :category
  belongs_to :offer

  # accepts_nested_attributes_for :category, reject_if: all_blank
end
