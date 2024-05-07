require "rails_helper"

RSpec.describe "Comment post" do
  let(:user) { create(:user) }

  before do
    login_as(user)
  end

  context "when an user like a post" do
    let(:other_user) { create(:user) }
    let(:post) { create(:post, author: user) }

    before do
      create(:comment, commenter: other_user, commentable: post)
    end

    it "shows notification" do
      visit user_notifications_path(user)

      expect(page).to have_content("#{other_user.username} commented you post")
    end

    it "shows notification counter" do
      visit user_notifications_path(user)

      within ".notification-count" do
        expect(page).to have_content("1")
      end
    end
  end
end
