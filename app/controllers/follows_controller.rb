class FollowsController < ApplicationController
  def create
    @followed_user = User.find(follow_params[:followed_user_id])
    @follow = Follow.create(follow_params)
    redirect_to @followed_user
  end

  def destroy
    @followed_user = User.find(params[:followed_user_id])
    @follow = Follow.find(params[:id])

    @follow.destroy

    redirect_to @followed_user
  end

  private

  def follow_params
    params.require(:follow).permit(:followed_user_id).merge(follower_id: current_user.id)
  end
end
