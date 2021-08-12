# == Schema Information
#
# Table name: bets
#
#  id                    :bigint           not null, primary key
#  player_id             :bigint           not null
#  round_id              :bigint           not null
#  color                 :integer          not null
#  bet_amount_cents      :integer          default(0), not null
#  bet_amount_currency   :string           default("CLP"), not null
#  prize_amount_cents    :integer          default(0), not null
#  prize_amount_currency :string           default("CLP"), not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
FactoryBot.define do
  factory :bet do
    association :player
    association :round
    color { Bet.colors.keys.to_a.sample }
  end
end
