class ArticleVersionsController < ApplicationController

  before_action :find_article, only: [:index]

  def index
    @article_versions = @article.versions
  end

  def show
  end

  private

    def find_article
      @article = Article.find params[:article_id]
    end

    
end
