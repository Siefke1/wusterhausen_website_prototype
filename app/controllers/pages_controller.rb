class PagesController < ApplicationController

  def home
    @offers = Offer.where(status: 'active').all.sample(11)
  end

  def about
  end
end
