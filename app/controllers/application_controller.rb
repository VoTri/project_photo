class ApplicationController < ActionController::Base
  before_action :search
  protect_from_forgery with: :exception

  def search
    @search = Photo.search(params[:q])
  end
end
