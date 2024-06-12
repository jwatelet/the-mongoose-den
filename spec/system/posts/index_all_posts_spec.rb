require "rails_helper"

RSpec.describe "Shows all posts" do
  context "with a logged user" do
    let(:user) { create(:user) }

    before do
      login_as(user)
      create_list(:post, 5, author: user)
    end

    context "with filter all" do
      context "with multiple posts created" do
        it "show all posts" do
          visit filtered_posts_path("all")
          expect(page).to have_css(".post-box", count: 5)
        end
      end
    end

    context "with no filter" do
      let(:followed_user) { create(:user) }
      let(:not_followed_user) { create(:user) }

      let!(:followed_post) { create(:post, author: followed_user) }
      let!(:not_followed_post) { create(:post, author: not_followed_user) }

      context "with multiple posts created" do
        it "shows only post from followed user" do
          create(:follow, followed_user:, follower: user)
          visit posts_path
          expect(page).to have_content(followed_post.title)
        end
      end
    end
  end

  context "without a logged user" do
    let(:user) { create(:user) }

    before do
      create_list(:post, 5, author: user)
    end

    context "with filter all" do
      context "with multiple posts created" do
        it "show all posts" do
          visit filtered_posts_path("all")
          expect(page).to have_css(".post-box", count: 5)
        end
      end
    end
  end
end
