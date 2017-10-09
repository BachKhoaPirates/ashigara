class UsersController < ApplicationController
  before_action :find_user
  before_action :authenticate_user!, only: %i(update)
  before_action :correct_permission, only: %i(update)

  attr_reader :user

  def show
    @shoe_bookmarks = @user.bookmarks.includes(:shoe)
  end

  def update
    if user.update_attributes user_params
      flash[:success] = "Update successfully!"
      redirect_to user
    else
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit :username, :dob, :sexes_id, :foot_length,
      :foot_width
  end

  def find_user
    @user = User.find(params[:id])

    return if user
    flash[:danger] = "User not found!"
    redirect_to root_path
  end

  def correct_permission
    unless user.current_user? current_user
      flash[:danger] = "Invalid permission!"
      redirect_to root_url
    end
  end
end
