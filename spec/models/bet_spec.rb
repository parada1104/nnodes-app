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
require 'rails_helper'

RSpec.describe Bet, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
