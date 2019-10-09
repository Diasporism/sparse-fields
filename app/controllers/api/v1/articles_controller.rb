class Api::V1::ArticlesController < ApplicationController
  def show
    @article  = Article.find(params[:id])
    @comments = @article.comments.where(parent: nil)
  end

  def update
    # Just pretend I wrote code here or something
  end

  def destroy
    # Just pretend I wrote code here or something
  end

  def show
    article = Article.find(params[:id])
    render jsonapi: article, fields: requested_fields_for(article), include: requested_include_for(article)
  end
end
