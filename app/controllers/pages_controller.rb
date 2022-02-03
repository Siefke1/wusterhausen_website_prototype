class PagesController < ApplicationController

  def home
    @offers = Offer.all
  end

  def about
  end
end
