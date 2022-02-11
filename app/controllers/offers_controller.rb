class OffersController < ApplicationController
  # before_action :set_offers_index, only: :index
  before_action :set_offer, only: [:show, :edit, :destroy]

  def index
    @category = Category.find(params[:topic_id])
    @offers = @category.offers

  end

  def choose_topic
    @topics = Topic.all
  end

  def show
  end

  def new
    @offer = Offer.new
    @user = current_user
    @topic = Topic.find(params[:topic_id])
    @categories = @topic.categories
    @offer.category_offers.build
    authorize @offer

  end

  def create
    @user = current_user
    @offer = Offer.new(offer_params)
    @offer.user_id = current_user.id
    # @offer.category_offers.build

    if @offer.save
      redirect_to root_path

     else

      render "new"
    end
    authorize @offer
  end

   def edit
    authorize Offer
    @offer = Offer.find(params[:id])
    @user = current_user
    @offer.category_offers.build
    authorize @offer
  end

  def update
    authorize Offer
    @offer = Offer.find(params[:id])

    if @offer.update(offer_params)
      redirect_to @offer
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @cat_off = CategoryOffer.find_by offer_id: params[:id]
    authorize Offer

    if @cat_off.destroy
      redirect_to profil_path, status: :see_other
    end
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
    params.require(:offer).permit(:user_id, :title, :description, :about_us, :town, :email, :address, :postcode ,category_ids: [])
  end
end
