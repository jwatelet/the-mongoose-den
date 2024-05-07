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
require "rails_helper"

RSpec.describe Notification, type: :model do
  it "has a valid Factory" do
    expect(build(:notification)).to be_valid
  end
end
