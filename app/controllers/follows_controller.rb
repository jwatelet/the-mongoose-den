class FollowsController < ApplicationController
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
