require "rails_helper"

RSpec.describe "Add a comment on a post" do
  let(:user) { create(:user) }
  let(:post) { create(:post) }

  before do
    login_as(user)
  end

  context "when the input is correct" do
    it "shows the comment" do
      visit post_path(post)
      fill_in "comment_content", with: "My best comment"
      click_on "Post comment"
      expect(page).to have_content("My best comment")
    end
  end
end
