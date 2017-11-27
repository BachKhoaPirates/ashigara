class SearchController < ApplicationController
  def index
    @title = "Result for: "
    @key = params[:term]

    search = params[:term].present? ? params[:term] : nil
    @shoe = if search
      @search_result = Shoe.search(search, fields: [:name])
    else
      @search_result = Shoe.limit(5)
    end
    #@search_result = Shoe.first(10)
  end
end
