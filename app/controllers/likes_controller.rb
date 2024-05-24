class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_likeable, only: %i[create]

  def create
    @like = @likeable.likes.new(liker: current_user)

    @like.save
    redirect_to @likeable
  end

  def destroy
    @like = Like.find(params[:id])
    @likeable = @like.likeable

    @like.destroy
    redirect_to @likeable
  end
end
