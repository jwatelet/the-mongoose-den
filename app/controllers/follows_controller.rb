class FollowsController < ApplicationController
  def followers
    @user = User.find(params[:user_id])
    @followers = @user.followers.page(params[:page])
  end

  def followed_users
    @user = User.find(params[:user_id])
    @followed_users = @user.followed_users.page(params[:page])
  end

  def create
    @followed_user = User.find(params[:user_id])
    @follow = Follow.create(followed_user_id: @followed_user.id, follower_id: current_user.id)
    redirect_to @followed_user
  end

  def destroy
    @followed_user = User.find(params[:user_id])
    @follow = Follow.find(params[:id])

    @follow.destroy

    redirect_to @followed_user
  end
end
