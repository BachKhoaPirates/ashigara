class BookmarksController < ApplicationController
  before_action :authenticate_user!


  def create
    load_shoe

    respond_to do |format|
      if current_user.add_bookmark?(params[:shoe_id])
        format.js
      else
        format.json { render json: {status: :failed} }
      end
    end

  end

  def index
    @bookmarks = current_user.bookmarks
  end

  def destroy
    load_shoe

    respond_to do |format|
      if current_user.delete_bookmark?(params[:shoe_id])
        format.js
      else
        format.json { render json: {status: :failed} }
      end
    end
  end

  private

  def load_shoe
    @shoe = Shoe.find_by_id(params[:shoe_id])
  end

end
