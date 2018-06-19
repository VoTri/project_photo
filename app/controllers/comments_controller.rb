class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      respond_to do |format|
        format.html do
          redirect_to @photo
        end
        format.js
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @photo = @comment.photo
    @comment.destroy
    @comments = @photo.comments
    respond_to do |format|
      format.html do
        redirect_to @photo
      end
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.html do
        redirect_to @photo
      end
      format.js
    end
  end

  def update
    @photo = @comment.photo
    if @comment.update(comment_params)
      @comments = @photo.comments.order("created_at desc")
      respond_to do |format|
        format.html do
          redirect_to @photo
        end
        format.js
      end
    end
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:user_id, :photo_id, :description)
  end
end
