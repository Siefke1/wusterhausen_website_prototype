class PagesController < ApplicationController

  def home
    @offers = Offer.all.sample(9)
  end

  def about
  end
end
