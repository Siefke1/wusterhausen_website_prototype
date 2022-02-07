class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    if current_user == "institution"
      @offers = current_user.offers
    else
      @offers = Offer.all
    end
  end

  def status
  end
end
