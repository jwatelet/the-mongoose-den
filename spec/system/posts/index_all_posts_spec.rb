require "rails_helper"

RSpec.describe "Shows all posts" do
  let(:user) { create(:user) }

  before do
    login_as(user)
    create_list(:post, 5, author: user)
  end

  context "with multiple posts created" do
    it "show all posts" do
      visit posts_path
      expect(page).to have_css(".post-box", count: 5)
    end
  end
end
