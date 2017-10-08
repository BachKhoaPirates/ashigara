class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @shoe_bookmarks = @user.bookmarks.includes(:shoe)
  end
end
