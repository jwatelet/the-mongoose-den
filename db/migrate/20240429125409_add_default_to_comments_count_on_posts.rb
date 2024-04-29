class AddDefaultToCommentsCountOnPosts < ActiveRecord::Migration[7.1]
  def change
    change_column_default :posts, :comments_count, 0
  end
end
