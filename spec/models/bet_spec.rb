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
  context "validation tests" do
    let(:bet) { FactoryBot.build(:bet) }

    it "has valid factory" do
      expect(bet).to be_valid
    end

    describe "active model validations" do
      it { expect(bet).to validate_presence_of(:player)}
      it { expect(bet).to validate_presence_of(:round)}
      it { expect(bet).to validate_presence_of(:betAmount)}
      it { expect(bet).to validate_presence_of(:prizeAmount)}
      it { expect(bet).to validate_numericality_of(:betAmount)}
      it { expect(bet).to validate_numericality_of(:prizeAmount)}
    end

    describe "active record associations" do
      it { expect(bet).to belong_to(:player)}
      it { expect(bet).to belong_to(:round)}
    end
  end
end
