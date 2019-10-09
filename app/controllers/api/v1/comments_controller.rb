class Api::V1::CommentsController < ApplicationController
  def show
    comment = Comment.find(params[:id])
    render jsonapi: comment, fields: requested_fields_for(comment), include: requested_include_for(comment)
  end

  def update
  end

  def destroy
  end
end
