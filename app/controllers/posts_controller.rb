class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]
  before_action :action_permited?, only: %i[edit update destroy]

  def index
    redirect_to new_user_session_path if current_user.nil? && params[:filter].nil?
    @posts = if params[:filter] == "all"
               Post.all
                   .includes(:author)
                   .order(created_at: :desc)
                   .page(params[:page])
             else
               Post.followed_users_posts(current_user)
                   .includes(:author)
                   .order(created_at: :desc)
                   .page(params[:page])
             end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post
                .comments
                .includes(:commenter)
                .order(:created_at)

    @comment = @post.comments.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])

    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def action_permited?
    post = Post.find(params[:id])

    redirect_to root_path, alert: "Not authorized action" if current_user.id != post.author_id
  end
end
