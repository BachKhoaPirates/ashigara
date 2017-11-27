class CategoriesController < ApplicationController
  before_action :check_params

  def show
    @title = "Result for category: "
    @key = Category.find(params[:id]).name
    @search_result = Shoe.where(category_id: params[:id])
  end

  private

  def check_params
    return if params[:id] && Category.find_by(id: params[:id])
    flash[:danger] = "Invalid category"
    redirect_back(fallback_location: root_path)
  end
end
