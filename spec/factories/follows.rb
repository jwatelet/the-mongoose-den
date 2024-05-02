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
FactoryBot.define do
  factory :follow do
    follower { create(:user) }
    followed_user { create(:user) }
  end
end
