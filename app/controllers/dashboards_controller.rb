class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @offers = current_user.offers
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
      @offers = Offer.all.order('created_at DESC')
    end
  end

  def blog_board
    if params[:query].present?
      # Search by title
      @articles = Article.search_by_title("%#{params[:query]}%")
    else
      @articles = Article.all.order("created_at DESC")
    end
  end

  def user_board
    if params[:query].present?
      # Search by title
      @users = User.search_by_email("%#{params[:query]}%")
    else
      @users = User.all
    end
  end

  def destroy
    @user = Users.find(params[:id])
    @user.destroy!

    redirect_to user_board_path

    respond_to do |format|
      format.xml  { head :ok }
      format.json { respond_to_destroy(:ajax) }
      format.html { respond_to_destroy(:html) }
    end
  end

  def offer_board
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
      @offers = Offer.all.order('created_at DESC')
    end
  end
end
