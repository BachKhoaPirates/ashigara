class ShoesController < ApplicationController
  def index
    #@shoes = Shoe.all.paginate page: params[:page]
    @shoes = Shoe.all
  end

  def show
    @shoe = Shoe.find_by id: params[:id]
    @reviews = @shoe.reviews
    @shoe_shops = @shoe.shoe_shops.includes(:shop)
    Rails.logger.info "Shoe Brand: #{@shoe.brand_id}"
    @recommend_shoe = Shoe.where(brand_id: @shoe.brand_id).limit(5)
    unless @shoe.present?
      redirect_to root_path
    end
  end
end
