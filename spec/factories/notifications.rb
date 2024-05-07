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
FactoryBot.define do
  factory :notification do
    message { Faker::Lorem.sentence }
    url { Faker::Internet.url }
    is_read { false }
    user { create(:user) }
    notifiable { create(:follow) }
  end
end
