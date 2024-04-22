# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  body       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :post do
    body { Faker::Lorem.sentence }
  end
end
