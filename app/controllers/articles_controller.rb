class ArticlesController < ApplicationController
  before_action :article, only: %i[show edit]
  before_action :authenticate_user!
  helper_method :current_user_or_admin?, :admin?

  def index
    if admin?
      @articles = Article.all.order(created_at: :desc)
    else
      @articles = current_user.articles.all.order(created_at: :desc)
    end
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    if @article = Articles::Create.new(article_params, current_user).call
      redirect_to @article
    else
      render :new
    end
  end

  def edit; end

  def update
    if current_user_or_admin?
      Articles::Update.new(article, article_params).call
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    if current_user_or_admin?
      Articles::Destroy.new(article).call
    end
    redirect_to articles_path
  end

  private

  def article
    @article ||= Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :article_type, :status, :image)
  end

  def current_user_or_admin?
    current_user == article.user || current_user.admin
  end

  def admin?
    current_user.admin
  end
end
