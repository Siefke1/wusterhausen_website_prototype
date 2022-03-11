class PagesController < ApplicationController

  def home
    @offers = Offer.all.sample(11)
  end

  def about
  end
end
