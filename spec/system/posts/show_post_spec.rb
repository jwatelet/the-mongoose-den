require "rails_helper"

RSpec.describe "Show post" do
  let(:user) { create(:user) }

  before do
    login_as(user)
  end

  context "when user own the post" do
    let(:post) { create(:post, author: user) }

    it "shows edit button" do
      visit post_path(post)
      expect(page).to have_content("Edit")
    end

    it "shows destroy button" do
      visit post_path(post)
      expect(page).to have_content("Destroy")
    end
  end

  context "when user do not own the post" do
    let(:post) { create(:post) }

    it "do not shows edit button" do
      visit post_path(post)
      expect(page).not_to have_content("Edit")
    end

    it "do not shows destroy button" do
      visit post_path(post)
      expect(page).not_to have_content("Destroy")
    end
  end
end
