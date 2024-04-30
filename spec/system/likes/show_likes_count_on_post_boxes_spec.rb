require "rails_helper"

RSpec.describe "Post have the likes counts on boxes" do
  let(:user) { create(:user) }
  let(:post_author) { create(:user) }

  let(:post) { create(:post, author: post_author) }

  before do
    login_as(user)
  end

  context "when a post have likes" do
    let!(:like1) { create(:like, likeable: post) }
    let!(:like2) { create(:like, likeable: post) }
    let!(:like3) { create(:like, likeable: post) }

    it "show the number of likes" do
      visit posts_path

      within ".like" do
        expect(page).to have_content("3")
      end
    end
  end

  context "when a post do not have comments" do
    let!(:post) { create(:post, author: post_author) }

    it "show the number of likes" do
      visit posts_path

      within ".like" do
        expect(page).to have_content("0")
      end
    end
  end
end
