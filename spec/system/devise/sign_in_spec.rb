require "rails_helper"

RSpec.describe "Sign in" do
  let(:user) { create(:user, email: "test@test-mail.com") }

  context "when inputs are valid" do
    it "signs in sucessfully" do
      visit new_user_session_path
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_on "commit"
      expect(page).to have_content("Signed in successfully.")
    end
  end
end
