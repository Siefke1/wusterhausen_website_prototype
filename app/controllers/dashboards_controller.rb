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
    if params[:query].present?
      if /\b((?:0[1-46-9]\d{3})|(?:[1-357-9]\d{4})|(?:[4][0-24-9]\d{3})|(?:[6][013-9]\d{3}))\b/.match(params[:query])
        @offers = Offer.where(postcode: "#{params[:query]}")
      else
        # IF NOT ZIPCODE LOOKS FOR OFFER TITLE
        @offers = Offer.search_by_title("%#{params[:query]}%")
      end
      # sql_query = " \
      #   offers.title @@ :query \
      #   OR offers.postcode @@ :query \
      # "
    else
      @offers = Offer.all.order("created_at DESC")
    end
  end

  def toggle_status
    @offer.active! if @offer.inactive?
    @offer.inactive! if @offer.active?
    raise
    redirect_to admin_url, notice: 'Post status has been updated.'
  end

end
