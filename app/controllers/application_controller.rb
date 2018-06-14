class ApplicationController < ActionController::Base
  before_action :load_search, :load_catefory
  protect_from_forgery with: :exception

  def load_search
    @search = Photo.search(params[:q])
  end

  def load_catefory
    @categories = Category.all
  end
end
