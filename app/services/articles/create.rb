module Articles
  class Create
    def initialize(article_params, current_user)
      @article_params = article_params
      @current_user = current_user
    end

    def call
      @current_user.articles.create(@article_params)
    end
  end
end
