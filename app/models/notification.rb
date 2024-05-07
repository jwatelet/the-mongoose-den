# == Schema Information
#
# Table name: notifications
#
#  id              :bigint           not null, primary key
#  is_read         :boolean          default(FALSE)
#  message         :string
#  notifiable_type :string           not null
#  url             :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  notifiable_id   :bigint           not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_notifications_on_notifiable  (notifiable_type,notifiable_id)
#  index_notifications_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Notification < ApplicationRecord
  paginates_per 10

  belongs_to :user
  belongs_to :notifiable, polymorphic: true

  scope :most_recent, -> { order(created_at: :desc) }
  scope :not_read, -> { where(is_read: false) }

  def mark_as_read
    update(is_read: true)
  end
end
