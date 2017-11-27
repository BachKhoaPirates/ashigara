class BrandsController < ApplicationController
  before_action :check_params

  def show
    @title = "Result for brand: "
    @key = Brand.find(params[:id]).name
    @search_result = Shoe.where(brand_id: params[:id])
  end

  private

  def check_params
    return if params[:id] && Brand.find_by(id: params[:id])
    flash[:danger] = "Invalid brand"
    redirect_back(fallback_location: root_path)
  end
end
