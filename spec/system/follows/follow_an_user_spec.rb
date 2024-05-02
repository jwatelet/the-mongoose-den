require "rails_helper"

RSpec.describe "Follow or unfollow" do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  before do
    login_as(user)
  end

  context "when you do not follow the user" do
    it "will follow the user" do
      visit user_path(other_user)
      click_on "Follow"
      expect(page).to have_css(".unfollow")
    end
  end

  context "when you follow the user" do
    it "will unfollow the user" do
      create(:follow, follower: user, followed_user: other_user)

      visit user_path(other_user)
      click_on "Unfollow"
      expect(page).to have_css(".follow")
    end
  end
end
