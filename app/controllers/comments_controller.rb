class CommentsController < ApplicationController
  before_action :set_commentable, only: %i[create new]

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)

    if @comment.save

      redirect_to @commentable
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :commenter_id).merge(commenter_id: current_user.id)
  end
end
