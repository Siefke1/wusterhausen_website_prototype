class PagesController < ApplicationController

  def home
    @offers = Offer.all.sample(4)

  end

  def about
  end
end
