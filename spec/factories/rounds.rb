# == Schema Information
#
# Table name: rounds
#
#  id          :bigint           not null, primary key
#  color       :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  started_at  :datetime
#  finished_at :datetime
#
FactoryBot.define do
  factory :round do
    color { Round.colors.keys.to_a.sample}
  end
end
