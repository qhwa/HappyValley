class ArticleVersionsController < ApplicationController

  before_action :find_article, only: [:index, :show]

  def index
    @article_versions = @article.versions
  end

  def show
    @article_version = @article.versions.find params[:id]
  end

  private

    def find_article
      @article = Article.find params[:article_id]
    end

    
end
