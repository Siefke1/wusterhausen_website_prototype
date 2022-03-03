class OffersController < ApplicationController
  # before_action :set_offers_index, only: :index
  before_action :set_offer, only: [:show, :edit, :destroy, :toggle_status]

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
      # UserMailer.with(user: @user).welcome.deliver_now
      EmailJob.set(wait: 10.seconds).perform_later(@user.id, @offer.id)
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
    if @offer.destroy
      if current_user.role == "admin"
        redirect_to admin_path, status: :see_other
      else
      redirect_to profil_path, status: :see_other
      end
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

  def toggle_status
    if @offer.active?
      @offer.inactive!
    else @offer.inactive?
      @offer.active!
    end
    redirect_to admin_url, notice: 'Post status has been updated.'
  end

  private

  def set_offers_index
    @offers = Offer.find(params[:category_id])
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit(:user_id, :title, :description, :about_us, :town, :email, :address, :postcode, :photo, category_ids: [])
  end
end
