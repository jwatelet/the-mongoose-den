require "rails_helper"

RSpec.describe "Shows all posts" do
  let(:user) { create(:user) }

  before do
    login_as(user)
  end

  context "with three multiple posts created" do
    it "show all posts" do
      create(:post, author: user)
      create(:post, author: user)
      create(:post, author: user)
      visit posts_path
      expect(page).to have_css(".post-box", count: 3)
    end
  end
end
