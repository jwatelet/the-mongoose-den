module PostsHelper
  def owner?(post)
    post.user_id == current_user.id
  end
end
