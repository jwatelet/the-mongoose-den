require "rails_helper"

RSpec.describe "Show all users" do
  let(:user) { create(:user) }

  before do
    login_as(user)
    create_list(:user, 5)
  end

  context "when there are multiple users" do
    it "show all posts" do
      visit users_path
      expect(page).to have_css(".user", count: 5)
    end
  end
end
