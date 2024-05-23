# == Schema Information
#
# Table name: likes
#
#  id            :bigint           not null, primary key
#  likeable_type :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  likeable_id   :bigint           not null
#  liker_id      :bigint           not null
#
# Indexes
#
#  index_likes_on_likeable  (likeable_type,likeable_id)
#  index_likes_on_liker_id  (liker_id)
#
# Foreign Keys
#
#  fk_rails_...  (liker_id => users.id)
#
class Like < ApplicationRecord
  after_create :notify_likeable

  belongs_to :likeable, polymorphic: true, counter_cache: true
  belongs_to :liker, class_name: "User"
  has_many :notifications, as: :notifiable, dependent: :destroy

  private

  def notify_likeable
    case likeable_type
    when "Post"
      notify_post_author
    end
  end

  def notify_post_author
    Notification.create(
      message: "#{liker.username} liked your post",
      notifiable: self,
      url: Rails.application.routes.url_helpers.post_path(likeable),
      user: likeable.author
    )
  end
end
