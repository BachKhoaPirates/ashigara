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
    if current_user
      @recommend_shoe = Size.joins(:shoe).find_by(foot_length: current_user.foot_length, foot_width: current_user.foot_width)
    end
    unless @shoe.present?
      redirect_to root_path
    end
  end
end
