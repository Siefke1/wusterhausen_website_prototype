class OffersController < ApplicationController
  before_action :set_offers_index, only: :index
  before_action :set_offer, only: [:show, :edit, :destroy]

  def index
    @category = Category.find(params[:topic_id])
    @offers = @category.offers
  end

  def show
    #@category = Category.find(params[:category_id])
  end

  def new
    @offer = Offer.new
    @topics = Topic.all
    # @topics = Topic.all
    # @categories = Category.all
    @categories = Category.all
    authorize @offer
  end

  def create
    @offer = Offer.new(offer_params)
    if @offer.save
      redirect_to root_path
    else
      render "new"
    end
    authorize @offer
  end

  def edit
  end

  def destroy
  end

  def authorize_offer
    @offer.status = 1
    @offer.save
    render "show"
  end

  def close_offer
    @offer.status = 2
    @offer.save
    render "show"
  end

  private

  def set_offers_index
    @offers = Offer.find(params[:category_id])
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit(:title, :description, :about_us, :email, :postcode, :category_id)
  end
end
