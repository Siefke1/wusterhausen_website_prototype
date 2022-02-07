class SearchesController < ApplicationController
  def index
    if params[:query].present?
      if /\b((?:0[1-46-9]\d{3})|(?:[1-357-9]\d{4})|(?:[4][0-24-9]\d{3})|(?:[6][013-9]\d{3}))\b/.match(params[:query])
        @offers = Offer.near("#{params[:query]}, Deutschland")

      else
        @offers = Offer.search_by_title("%#{params[:query]}%")
      end
      # sql_query = " \
      #   offers.title @@ :query \
      #   OR offers.postcode @@ :query \
      # "
    else
      @offers = []
    end
  end
end
