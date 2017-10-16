class ShoesController < ApplicationController
  def index
    #@shoes = Shoe.all.paginate page: params[:page]
    @shoes = Shoe.all
  end

  def show
    @shoe = Shoe.find_by id: params[:id]
    unless @shoe.present?
      redirect_to root_path
    end
  end
end
