class PagesController < ApplicationController
  def home
    @articles = Article.all.order(created_at: :desc)
  end
end
