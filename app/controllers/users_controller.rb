class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_update_is_authorized, only: %i[edit update]

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)

      redirect_to @user, notice: "Profile updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def check_if_update_is_authorized
    @user = User.find(params[:id])

    redirect_to root_path, alert: "Not authorized action" if current_user.id != @user.id
  end

  def user_params
    params.require(:user).permit(:username)
  end
end
