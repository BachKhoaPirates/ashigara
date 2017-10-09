class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    @shoe = Shoe.find(params[:shoe_id])
    @reviews = @shoe.reviews
  end

  def show
    @review = Review.find(params[:id])
  end
end
