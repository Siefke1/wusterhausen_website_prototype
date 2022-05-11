class PagesController < ApplicationController

  def home
    @offers = Offer.where(status: 'active').all.sample(10)
  end

  def about
  end
end
