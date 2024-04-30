require "rails_helper"

RSpec.describe "Likes on posts" do
  let(:user) { create(:user) }

  before do
    login_as(user)
  end

  context "when post is not liked by the user" do
    it "shows the like icon" do
      create(:post, author: user)

      visit posts_path
      click_on(class: "like")
      expect(page).to have_css(".dislike")
    end
  end

  context "when post liked by the user" do
    let(:post) { create(:post, author: user) }

    it "shows the dislike icon" do
      create(:like, likeable: post, liker: user)

      visit posts_path
      click_on(class: "dislike")
      expect(page).to have_css(".like")
    end
  end
end
