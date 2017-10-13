class VotesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :find_vote, only: [:destroy]
  before_action :find_review, only: [:vote_count, :index]

  def index
    if @review
      @votes = @review.votes
    else
      flash[:danger] = "Review not found!"
      redirect_back(fallback_location: request.referer)
    end
  end

  def create
    @vote = Vote.new vote_params
    @vote.user_id = current_user.id
    if @vote.save
      flash[:notice] = "Saved..."
      redirect_back(fallback_location: request.referer)
    else
      flash[:danger] = @vote.full_error
      redirect_back(fallback_location: request.referer)
    end
  end

  def destroy
    if @vote.destroy
      flash[:notice] = "Deleted..."
      redirect_back(fallback_location: request.referer)
    else
      flash[:danger] = @vote.full_error
      redirect_back(fallback_location: request.referer)
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:review_id, :vote_type)
  end

  def find_vote
    @vote = Vote.find_by id: params[:id]

    unless @vote
      flash[:danger] = "Vote not found!"
      redirect_back(fallback_location: request.referer)
    end
  end

  def find_review
    @review = Review.find_by id: params[:review_id]

    unless @review
      flash[:danger] = "Review not found!"
      redirect_back(fallback_location: request.referer)
    end
  end
end
