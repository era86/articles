class ArticlesController < ApplicationController
  respond_to :json

  def show
    render json: Article.find(params[:id])
  end

  def create
    @article = Article.new(params[:article])
    if @article.save
      render json: @article
    end
  end
end
