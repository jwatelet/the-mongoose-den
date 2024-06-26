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
require "rails_helper"

RSpec.describe Post, type: :model do
  it "has a valid Factory" do
    expect(build(:post)).to be_valid
  end
end
