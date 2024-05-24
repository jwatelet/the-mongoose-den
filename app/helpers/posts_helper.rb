module PostsHelper
  def owner?(post)
    return false if current_user.nil?

    post.author_id == current_user.id
  end
end
