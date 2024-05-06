require "rails_helper"

RSpec.describe "Show all followed_users of an user" do
  let(:user) { create(:user) }

  before do
    login_as(user)
  end

  context "when user have multiple followed_users" do
    let(:followed_user1) { create(:user) }
    let(:followed_user2) { create(:user) }
    let(:followed_user3) { create(:user) }

    before do
      create(:follow, follower: user, followed_user: followed_user1)
      create(:follow, follower: user, followed_user: followed_user2)
      create(:follow, follower: user, followed_user: followed_user3)
    end

    it "shows followed_users" do
      visit followed_users_user_follows_path(user)

      expect(page).to have_css(".user", count: 3)
    end
  end
end
