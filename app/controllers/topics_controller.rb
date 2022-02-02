class TopicsController < ApplicationController
  before_action :set_topic, only: :show

  def index
    @topics = Topic.all
  end

  def show
    @categories = @topic.categories
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

end
