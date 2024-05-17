class MovePostsBodyToContent < ActiveRecord::Migration[7.1]
  def change

    Post.all.find_each do |post|
      post.update(content: post.body)
    end

    remove_column :posts, :body
  end
end
