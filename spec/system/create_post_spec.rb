require "rails_helper"

RSpec.describe "Creating a post" do
  let(:user) { create(:user) }

  before do
    login_as(user)
  end

  context "when inputs are valid" do
    it "creates a new post" do
      visit new_post_path
      fill_in "Title", with: "My marvelous new post"
      fill_in "Body", with: "A very interesting post about ruby on rails"
      click_on "Create Post"

      expect(page).to have_content("My marvelous new post")
    end
  end

  context "when inputs are not valid" do
    context "when title is missing" do
      it "shows the right error message" do
        visit new_post_path
        fill_in "Body", with: "A very interesting post about ruby on rails"
        click_on "Create Post"
        expect(page).to have_content("Title can't be blank")
      end
    end

    context "when the body is missing" do
      it "shows the right error message" do
        visit new_post_path
        fill_in "Title", with: "My marvelous new post"
        click_on "Create Post"
        expect(page).to have_content("Body can't be blank")
      end
    end

    context "when the body is too short" do
      it "shows the right error message" do
        visit new_post_path
        fill_in "Title", with: "My marvelous new post"
        fill_in "Body", with: "Short"
        click_on "Create Post"
        expect(page).to have_content("Body is too short (minimum is 10 characters)")
      end
    end
  end
end
