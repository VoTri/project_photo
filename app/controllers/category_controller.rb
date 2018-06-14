class CategoryController < ApplicationController
  def show
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end
end
