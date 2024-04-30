require "rails_helper"

RSpec.describe "Shows all posts" do
  let(:user) { create(:user) }

  before do
    login_as(user)
    create_list(:post, 20, author: user)
  end

  context "with three multiple posts created" do
    it "show all posts" do
      visit posts_path
      expect(page).to have_css(".post-box", count: 20)
    end
  end
end
