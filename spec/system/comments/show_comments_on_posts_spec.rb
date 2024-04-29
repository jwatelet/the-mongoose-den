require "rails_helper"

RSpec.describe "Show comments on posts" do
  let(:user) { create(:user) }
  let(:post_author) { create(:user) }
  let(:post) { create(:post, author: post_author) }
  let(:commenter1) { create(:user) }
  let(:commenter2) { create(:user) }
  let(:commenter3) { create(:user) }

  before do
    login_as(user)
  end

  context "when post has comments" do
    let!(:comment1) { create(:comment, commentable: post, commenter: commenter1) }
    let!(:comment2) { create(:comment, commentable: post, commenter: commenter2) }
    let!(:comment3) { create(:comment, commentable: post, commenter: commenter3) }

    it "shows the content of comment1" do
      visit post_path(post)
      expect(page).to have_content(comment1.content)
    end

    it "shows the content of comment2" do
      visit post_path(post)
      expect(page).to have_content(comment2.content)
    end

    it "shows the content of comment3" do
      visit post_path(post)
      expect(page).to have_content(comment3.content)
    end

    it "shows the content of comments" do
      visit post_path(post)
      expect(page).to have_css(".comment", count: 3)
    end

    it "shows the username of commenter" do
      visit post_path(post)
      expect(page).to have_content(commenter1.username)
    end
  end
end
