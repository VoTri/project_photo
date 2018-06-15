class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :load_search, :load_catefory

  def load_search
    @search = Photo.search(params[:q])
  end

  def load_catefory
    @categories = Category.all
  end
end
