class CategoryOffer < ApplicationRecord
  belongs_to :category
  belongs_to :offer
end
