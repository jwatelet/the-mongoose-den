require "rails_helper"

RSpec.describe "Notification for follows" do
  let(:user) { create(:user) }

  before do
    login_as(user)
  end

  context "when an user follows another" do
    let(:other_user) { create(:user) }

    before do
      create(:follow) { create(:follow, follower: other_user, followed_user: user) }
    end

    it "shows notification" do
      visit user_notifications_path(user)

      expect(page).to have_content("#{other_user.username} followed you")
    end

    it "shows notification counter" do
      visit user_notifications_path(user)

      within ".notification-count" do
        expect(page).to have_content("1")
      end
    end
  end
end
