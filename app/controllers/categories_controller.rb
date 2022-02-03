class CategoriesController < ApplicationController
  before_action :set_category, only: :show

  def index
    @topic = Topic.find(params[:topic_id])
    @categories = @topic.categories
  end

  def show
    @offers = @category.offers
    raise
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
