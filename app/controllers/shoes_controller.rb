class ShoesController < ApplicationController
  before_action :load_shoe, only: :show
  def index
    #@shoes = Shoe.all.paginate page: params[:page]
    @shoes = Shoe.all
  end

  def show
    @reviews = @shoe.reviews
    @shoe_shops = @shoe.shoe_shops.includes(:shop)
    if current_user
      @fitted_size = Size.where(foot_length: current_user.foot_length, foot_width: current_user.foot_width)
      if @fitted_size == nil || @fitted_size.count == 0
        @recommend_shoe = Shoe.all.limit(3)
      else
        @recommend_shoe = []
        @fitted_size.each do |size|
          @recommend_shoe.push(size.shoe)
        end
      end
      Rails.logger.info "Size of recommend shoe: #{@recommend_shoe.count}"
    end

    if !params[:foot_width].blank? && !params[:foot_length].blank?
      Rails.logger.info "Length: #{params[:foot_length]} - Width: #{params[:foot_width]}"
      @searched_fit_size = Size.where(foot_length: params[:foot_length], foot_width: params[:foot_width])
      if @searched_fit_size == nil
      else
        @searched_shoe = []
        Rails.logger.info "Type: #{@searched_fit_size.class}"

        @searched_fit_size.each do |size|
          @searched_shoe.push(size.shoe)
        end
      end
    end
  end
  private
  def load_shoe
    @shoe = Shoe.find_by id: params[:id]
    unless @shoe.present?
      redirect_to root_path
    end
  end
end
