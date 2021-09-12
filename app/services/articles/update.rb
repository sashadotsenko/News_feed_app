module Articles
  class Update
    def initialize(article, article_params)
      @article = article
      @article_params = article_params
    end

    def call
      @article.update(@article_params)
    end
  end
end
