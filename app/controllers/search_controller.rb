class SearchController < ApplicationController
  def index
    search = params[:term].present? ? params[:term] : nil
    @shoe = if search
      @search_result = Shoe.search(search, fields: [:name])
    else
      @search_result = Shoe.limit(5)
    end
  end

  private
end
