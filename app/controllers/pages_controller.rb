class PagesController < ApplicationController
  def home
    unless user_signed_in?
      redirect_to new_user_session_path
    else
      redirect_to shoes_path
    end
  end
end
