class ShoesController < ApplicationController
  before_action :load_shoe, only: :show
  def index
    #@shoes = Shoe.all.paginate page: params[:page]
    @shoes = Shoe.all
  end

  def show
    @reviews = @shoe.reviews
    @shoe_shops = @shoe.shoe_shops.includes(:shop)

    if user_signed_in?
      if current_user
        @fitted_size = Size.where(foot_length: current_user.foot_length,
          foot_width: current_user.foot_width, shoe_id: @shoe.id)
        if @fitted_size == nil || @fitted_size.count == 0
          @fitted_size = Size.where(shoe_id: @shoe.id).first
        else
          @fitted_size = @fitted_size.first
        end
      end

      if !params[:foot_width].blank? && !params[:foot_length].blank?
        Rails.logger.info "Length: #{params[:foot_length]} - Width: #{params[:foot_width]}"
        @searched_fit_size = Size.where(foot_length: params[:foot_length],
          foot_width: params[:foot_width], shoe_id: @shoe.id)
        if @searched_fit_size == nil || @searched_fit_size.count == 0
          @searched_fit_size = Size.where(shoe_id: @shoe.id).first
        else
          @searched_fit_size = @searched_fit_size.first
        end
        flash[:notice] = 'Suggest shoe size: ' + @searched_fit_size.size.to_s
      end
      end
    end


  def autocomplete
    render json: Shoe.search(params[:query], {
      fields: ["name"],
      limit: 10,
      load: false,
      misspellings: {below: 5}
    }).map(&:name)
  end

  private

  def load_shoe
    @shoe = Shoe.find_by id: params[:id]
    unless @shoe.present?
      redirect_to root_path
    end
  end
end
