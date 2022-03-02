class CategoriesController < ApplicationController
  before_action :set_category, only: :show

  def index
    @topic = Topic.find(params[:topic_id])
    @categories = @topic.categories
  end

  def show
    @offers = @category.offers.where(status: "active")
    @topic = Topic.find(params[:id])
  end

  def new
    @category = Category.new
    @topics = Topic.all
    authorize @category
  end

  def create
    @category = Category.new(category_params)
    @topic = @category.topic
    authorize @category
    if @category.save
      redirect_to topic_path(@topic)
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:title, :topic_id, :photo)
  end

  def set_category
    @category = Category.find(params[:topic_id])
  end
end
