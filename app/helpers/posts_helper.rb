module PostsHelper
  def owner?(post)
    post.author_id == current_user.id
  end
end
