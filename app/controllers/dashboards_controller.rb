class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    if current_user == "institution"
      @offers = current_user.offers
    elsif current_user == "admin"
      @offers = Offer.all
    else
      @offers = []
    end
  end

  def status
  end
end
