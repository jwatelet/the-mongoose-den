require "rails_helper"

RSpec.describe "Sign up" do
  context "when inputs are valid" do
    it "signs up sucessfully" do
      visit new_user_registration_path
      fill_in "Email", with: "test@test-mail.com"
      fill_in "Password", with: "azerty1234"
      fill_in "Password confirmation", with: "azerty1234"
      click_on "commit"
      expect(page).to have_content("Welcome! You have signed up successfully.")
    end
  end
end
