class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # CRUD

  def show
    @user = User.find(@article.user_id)
    @offers = Offer.find(@user.offer_ids.sample(3))
  end

  def index
    @articles = Article.all.order("created_at DESC")
  end

  def new
    @article = Article.new
    authorize @article
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
    authorize @article
  end

  def edit
    authorize @article
  end

  def update
    @article.user = current_user
    if @article.update(article_params)
      redirect_to articles_path
    else
      render :edit
    end
    authorize @article
  end

  def destroy
    if @article.delete
      redirect_to articles_path
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :user_id, :photo)
  end
end
