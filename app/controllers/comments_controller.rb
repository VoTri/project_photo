class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  def new
    @comment = Comment.new(parent_id: params[:parent_id])
    @comment_old = Comment.find_by(id: params[:parent_id])
    @photo = Photo.find_by(id: @comment_old.photo_id)
    @comment.photo_id = @photo.id
    respond_to do |format|
      format.html do
        redirect_to @photo
      end
      format.js
    end
  end

  def create
    if comment_params["parent_id"].nil?
      @photo = Photo.find(params[:photo_id])
      @comment = @photo.comments.build(comment_params)
    else
      @comment_old = Comment.find_by(id: comment_params["parent_id"].to_i)
      @photo = Photo.find_by(id: @comment_old.photo_id)
      @comment = @photo.comments.build(comment_params)
    end
    @comment.user_id = current_user.id
    if @comment.save
      @comments = @photo.comments.order("created_at desc").where(parent_id: nil).page(params[:page]).per(10)
      @comments_parents = @photo.comments.order("created_at desc").where(parent_id: @comment.id)
      respond_to do |format|
        format.html do
          redirect_to @photo
        end
        format.js
      end
    else
      redirect_to @photo
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @photo = @comment.photo
    if @comment.parent_id.nil?
      @comments = Comment.where(parent_id: @comment.id)
      unless @comments.nil?
        if @comments.length > 1
          @comments.each do |comment|
            comment.destroy
          end
        elsif @comments.length > 0
          @comments.destroy
        end
      end
      @comment.destroy
      @comments = @photo.comments.order("created_at desc").where(parent_id: nil).page(params[:page]).per(10)
    else
      @comments = @photo.comments.order("created_at desc").where(parent_id: nil).page(params[:page]).per(10)
      @comment_old = Comment.find_by(id: @comment.parent_id)
      @comment.destroy
      @comments_parents = @photo.comments.order("created_at desc").where(parent_id: @comment_old.id)
    end
    respond_to do |format|
      format.html do
        redirect_to @photo
      end
      format.js
    end
  end

  def edit
    @photo = @comment.photo
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
      @comments = @photo.comments.order("created_at desc").where(parent_id: nil).page(params[:page]).per(10)
      @comments_parents = @photo.comments.order("created_at desc").where(parent_id: @comment.id)
      respond_to do |format|
        format.html do
          redirect_to @photo
        end
        format.js
      end
    else
      render 'edit'
    end
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:user_id, :photo_id, :description, :parent_id)
  end
end
