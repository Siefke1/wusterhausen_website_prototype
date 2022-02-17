class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    if current_user == "institution"
      @offers = current_user.offers
    else
      @offers = Offer.all
    end
  end

  def admin
    @offers = Offer.all
  end

  def toggle_status
    @offer.active! if @offer.inactive?
    @offer.inactive! if @offer.active?
    raise
    redirect_to admin_url, notice: 'Post status has been updated.'
  end

end
