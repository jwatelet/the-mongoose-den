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
require "rails_helper"

RSpec.describe Comment, type: :model do
  context "when the commentable is a post" do
    it "has a valid Factory" do
      expect(build(:comment)).to be_valid
    end
  end
end
