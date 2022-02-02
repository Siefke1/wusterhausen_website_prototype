class OffersCategory < ApplicationRecord
  belongs_to :offer
  belongs_to :category
end
