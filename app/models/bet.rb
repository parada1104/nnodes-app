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
class Bet < ApplicationRecord
  enum color: { green: 0, red: 1, black: 2 }

  ##associations
  belongs_to :player
  belongs_to :round

  #money
  monetize :betAmount_cents, as: :betAmount, allow_nil: false
  monetize :prizeAmount_cents, as: :prizeAmount, allow_nil: true

  ##validations
  validates :player, presence: true, uniqueness: { scope: :round_id, message: "you can't bet more than once per round" }
  validates :round, presence: true
  validates :betColor, presence: true
  validates :betAmount, presence: true, numericality: true
  validates :prizeAmount, presence: true, numericality: true
end
