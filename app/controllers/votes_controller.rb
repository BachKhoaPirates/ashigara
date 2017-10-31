class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    load_review

    respond_to do |format|
      if current_user.add_vote?(params[:review_id])
        format.js
      else
        format.json { render json: {status: :failed} }
      end
    end

  end

  def destroy
    load_review

    respond_to do |format|
      if current_user.delete_vote?(params[:review_id])
        format.js
      else
        format.json { render json: {status: :failed} }
      end
    end
  end

  private

  def load_review
    @review = Review.find_by_id(params[:review_id])
  end
end
