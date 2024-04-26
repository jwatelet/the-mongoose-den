require "rails_helper"

RSpec.describe "Update profile" do
  let(:user) { create(:user) }

  before do
    login_as(user)
  end

  context "when inputs are valid" do
    it "updates sucessfully" do
      visit edit_user_path(user)
      fill_in "Username", with: "Killer666", fill_options: { clear: :backspace }
      click_on "commit"
      expect(page).to have_content("Killer666")
    end
  end

  context "when an non permited user try to edit another user" do
    let(:another_user) { create(:user) }

    it "shows an error" do
      visit edit_user_path(another_user)
      expect(page).to have_content("Not authorized action")
    end
  end
end
