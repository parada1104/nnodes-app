# == Schema Information
#
# Table name: players
#
#  id               :bigint           not null, primary key
#  name             :string           not null
#  last_name        :string           not null
#  balance_cents    :integer          default(1000000), not null
#  balance_currency :string           default("CLP"), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  status           :integer          default("active"), not null
#
FactoryBot.define do
  factory :player do
    name { Faker::Name.name }
    last_name { Faker::Name.last_name }
  end
end
