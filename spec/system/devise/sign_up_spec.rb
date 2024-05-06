require "rails_helper"

RSpec.describe "Sign up" do
  context "when inputs are valid" do
    it "creates account" do
      visit new_user_registration_path
      fill_in "Email", with: "test@test-mail.com"
      fill_in "Username", with: "test1234"
      fill_in "Password", with: "azerty1234"
      fill_in "Password confirmation", with: "azerty1234"
      click_on "commit"
      expect(page).to have_content("You need to sign in or sign up before continuing.")
    end
  end
end
