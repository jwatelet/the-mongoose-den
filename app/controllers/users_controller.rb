class UsersController < ApplicationController
  before_action :action_permited?, only: %i[edit update]

  def index
    @users = User.where.not(id: current_user.id)
                 .page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
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

  def user_params
    params.require(:user).permit(:username)
  end

  def action_permited?
    @user = User.find(params[:id])

    redirect_to root_path, alert: "Not authorized action" if current_user.id != @user.id
  end
end
