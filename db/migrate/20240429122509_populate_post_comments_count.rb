class PopulatePostCommentsCount < ActiveRecord::Migration[7.1]
  def change
    Post.find_each do |post|
      Post.reset_counters(post.id, :comments)
    end
  end
end
