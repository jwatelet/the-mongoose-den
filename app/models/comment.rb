# == Schema Information
#
# Table name: comments
#
#  id               :bigint           not null, primary key
#  commentable_type :string           not null
#  content          :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  commentable_id   :bigint           not null
#  commenter_id     :bigint           not null
#
# Indexes
#
#  index_comments_on_commentable   (commentable_type,commentable_id)
#  index_comments_on_commenter_id  (commenter_id)
#
# Foreign Keys
#
#  fk_rails_...  (commenter_id => users.id)
#
class Comment < ApplicationRecord
  after_create :notify_commentable

  belongs_to :commentable, polymorphic: true, counter_cache: true
  belongs_to :commenter, class_name: "User"

  validates :content, presence: true

  private

  def notify_commentable
    case commentable_type
    when "Post"
      notify_post_author
    end
  end

  def notify_post_author
    Notification.create(
      message: "#{commenter.username} commented you post",
      notifiable: self,
      url: Rails.application.routes.url_helpers.post_path(commentable),
      user: commentable.author
    )
  end
end
