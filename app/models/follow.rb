# == Schema Information
#
# Table name: follows
#
#  id               :bigint           not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  followed_user_id :bigint           not null
#  follower_id      :bigint           not null
#
# Indexes
#
#  index_follows_on_followed_user_id  (followed_user_id)
#  index_follows_on_follower_id       (follower_id)
#
# Foreign Keys
#
#  fk_rails_...  (followed_user_id => users.id)
#  fk_rails_...  (follower_id => users.id)
#
class Follow < ApplicationRecord
  after_create :notify_followed_user

  belongs_to :follower, class_name: "User"
  belongs_to :followed_user, class_name: "User"
  has_many :notifications, as: :notifiable, dependent: :destroy

  private

  def notify_followed_user
    Notification.create(
      message: "#{follower.username} followed you",
      notifiable: self,
      url: Rails.application.routes.url_helpers.user_path(follower),
      user: followed_user
    )
  end
end
