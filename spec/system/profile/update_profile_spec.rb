require "rails_helper"

RSpec.describe "Update profile" do
  let(:user) { create(:user) }

  before do
    login_as(user)
  end

  context "when inputs are valid" do
    it "updates sucessfully" do
      visit edit_user_path(user)
      fill_in "Username", with: ""
      fill_in "Username", with: "Killer666"
      click_on "commit"
      expect(page).to have_content("Killer666")
    end
  end
end
