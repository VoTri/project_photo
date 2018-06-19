class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    if params[:q].nil?
      authenticate_user!
      @photos = Photo.all.where(user_id: current_user.id).page params[:page]
    else
      @photos = @search.result
    end
  end

  def show
    @comments = @photo.comments.order("created_at desc")
    @new_comment = @photo.comments.new
  end

  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    respond_to do |format|
      if @photo.save
        format.html { redirect_to photos_url, notice: t("controllers.photos.creat_success") }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update_attributes(photo_params)
        format.html { redirect_to photos_url, notice: t("controllers.photos.update_success") }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: t("controllers.photos.destroy_success") }
      format.json { head :no_content }
    end
  end

  private
  def set_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:title, :description, :image_url,
      cate_photos_attributes: [:id, :photo_id, :category_id, :_destroy])
  end

  def set_user
    if @photo.user_id != current_user.id
      redirect_to root_path
    end
  end
end
