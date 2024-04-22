# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  body       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "rails_helper"

RSpec.describe Post, type: :model do
  it "has a valid Factory" do
    expect(build(:post)).to be_valid
  end
end
