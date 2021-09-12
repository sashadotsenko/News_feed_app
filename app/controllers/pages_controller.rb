class PagesController < ApplicationController
  def home
    @articles = Article.all.order(created_at: :desc).where(status: "published")
  end
end
