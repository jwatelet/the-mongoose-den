class LikesController < ApplicationController
  before_action :set_likeable, only: %i[create]

  def create
    @like = @likeable.likes.new(liker: current_user)

    @like.save
    redirect_to root_path
  end

  def destroy
    @like = Like.find(params[:id])

    @like.destroy
    redirect_to root_path
  end
end
