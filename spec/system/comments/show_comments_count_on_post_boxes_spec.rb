require "rails_helper"

RSpec.describe "Post have the comment counts on boxes" do
  let(:user) { create(:user) }
  let(:post_author) { create(:user) }

  let(:post) { create(:post, author: post_author) }

  before do
    login_as(user)
  end

  context "when a post have comments" do
    let!(:comment1) { create(:comment, commentable: post) }
    let!(:comment2) { create(:comment, commentable: post) }
    let!(:comment3) { create(:comment, commentable: post) }

    it "show the number of comments" do
      visit filtered_posts_path("all")

      within ".comment" do
        expect(page).to have_content("3")
      end
    end
  end

  context "when a post do not have comments" do
    let!(:post) { create(:post, author: post_author) }

    it "show the number of comments" do
      visit filtered_posts_path("all")

      within ".comment" do
        expect(page).to have_content("0")
      end
    end
  end
end
