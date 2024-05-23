# == Schema Information
#
# Table name: posts
#
#  id             :bigint           not null, primary key
#  comments_count :integer          default(0)
#  likes_count    :integer          default(0)
#  title          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  author_id      :bigint           not null
#
# Indexes
#
#  index_posts_on_author_id  (author_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#
class Post < ApplicationRecord
  paginates_per 5

  belongs_to :author, class_name: "User", inverse_of: "posts"
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

  has_rich_text :content

  validates :title, presence: true
  validates :content, presence: true

  scope :followed_users_posts, ->(user) { where(author: user.followed_users) }
  scope :most_recent_first, -> { order(created_at: :desc) }

  def find_like_from(user)
    likes.find_by(likeable: self, liker: user)
  end
end
