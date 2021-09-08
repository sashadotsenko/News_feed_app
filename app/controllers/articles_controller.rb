class ArticlesController < ApplicationController
  before_action :article, only: %i[show edit]
  before_action :authenticate_user!, except: [:show, :index]

  def index
    if current_user.admin
      @articles = Article.all.order(created_at: :desc)
    elsif current_user
      @articles = current_user.articles.all.order(created_at: :desc)
    end
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)
  
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit; end

  def update
    if article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    if current_user == article.user || current_user.admin
      article.destroy
    end
    redirect_to articles_path
  end

  private

  def article
    @article ||= Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :article_type)
  end
end
