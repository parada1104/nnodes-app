# == Schema Information
#
# Table name: bets
#
#  id                   :bigint           not null, primary key
#  player_id            :bigint           not null
#  round_id             :bigint           not null
#  betColor             :integer          not null
#  betAmount_cents      :integer          default(0), not null
#  betAmount_currency   :string           default("CLP"), not null
#  prizeAmount_cents    :integer          default(0), not null
#  prizeAmount_currency :string           default("CLP"), not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
FactoryBot.define do
  factory :bet do
    association :player
    association :round
    betColor { Bet.colors.keys.to_a.sample }
    betAmount { 1300*100 }
    prizeAmount { 0 }
  end
end
