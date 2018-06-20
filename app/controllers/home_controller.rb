class HomeController < ApplicationController
  def index
    @photos = Photo.all.page(params[:page]).per(9)
  end
end
