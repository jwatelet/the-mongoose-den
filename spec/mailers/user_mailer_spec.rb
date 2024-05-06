require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "#welcome_email" do
    subject(:mail) { described_class.with(user:).welcome_email }

    let(:user) { create(:user) }

    it "renders the subject" do
      expect(mail.subject).to eq("Welcome to the Mongoose Den")
    end

    it "renders the receiver email" do
      expect(mail.to).to eq([user.email])
    end

    it "renders the sender email" do
      sender = "notifications@the-mongoose-den.com"
      expect(mail.from).to eq([sender])
    end
  end
end
