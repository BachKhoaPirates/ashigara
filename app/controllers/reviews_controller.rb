class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_review, only: [:show, :update, :edit, :destroy]

  def index
    @shoe = Shoe.find(params[:shoe_id])
    @reviews = @shoe.reviews.includes :votes
  end

  def show
  end

  def create
    @shoe = Shoe.find_by id: params[:shoe_id]
    @review = @shoe.reviews.new review_params
    @review.user = current_user
    if @review.save
      redirect_to @review.shoe
    else
      redirect_to root_path
    end
  end

  def update
    if @review.update review_params
      redirect_to @review.shoe
    else
      render :edit
    end
  end

  def edit

  end

  def destroy
    Rails.logger.info "Review content : #{@review.content}"
    @shoe = @review.shoe
    if @review.destroy
      redirect_to @shoe
    else
      redirect_to root_path
    end
  end

  private
  def review_params
    params.require(:review).permit(:content, :durability, :comfortability, :ventilation, :money_worthy, :vote_count,
      :shoe_id, :user_id)
  end

  def set_review
    @review = Review.find_by id: params[:id]
  end
end
