module Articles
  class Destroy
    def initialize(article)
      @article = article
    end

    def call
      @article.destroy
    end
  end
end
