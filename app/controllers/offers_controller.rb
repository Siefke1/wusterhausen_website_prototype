class OffersController < ApplicationController
  before_action :set_offers_index, only: :index
  before_action :set_offer, only: [:show, :edit, :destroy]

  def index
  end

  def show
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
  end

  def edit
  end

  def destroy
  end

  private

  def set_offers_index
    @offers = Offer.find(params[:category_id])
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params

  end
end
