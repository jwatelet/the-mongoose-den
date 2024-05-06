require "rails_helper"

RSpec.describe "Show all followers of an user" do
  let(:user) { create(:user) }

  before do
    login_as(user)
  end

  context "when user have multiple followers" do
    let(:follower1) { create(:user) }
    let(:follower2) { create(:user) }
    let(:follower3) { create(:user) }

    before do
      create(:follow, followed_user: user, follower: follower1)
      create(:follow, followed_user: user, follower: follower2)
      create(:follow, followed_user: user, follower: follower3)
    end

    it "shows followers" do
      visit followers_user_follows_path(user)

      expect(page).to have_css(".user", count: 3)
    end
  end
end
