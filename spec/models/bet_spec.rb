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
require 'rails_helper'

RSpec.describe Bet, type: :model do
  context "validation tests" do
    let(:bet) { FactoryBot.build(:bet) }

    it "has valid factory" do
      expect(bet).to be_valid
    end

    describe "active model validations" do
      it { expect(bet).to validate_presence_of(:player) }
      it { expect(bet).to validate_presence_of(:round) }
      it { expect(bet).to validate_presence_of(:color) }
      it { expect(bet).to validate_numericality_of(:bet_amount) }
      it { expect(bet).to validate_numericality_of(:prize_amount) }
      # it { expect(round).to validate_inclusion_of(:betColor).in_array(Bet.colors.keys) }
    end

    describe "active record associations" do
      it { expect(bet).to belong_to(:player) }
      it { expect(bet).to belong_to(:round) }
      it { expect(bet).to validate_uniqueness_of(:player).scoped_to(:round_id).with_message("you can't bet more than once per round") }
    end

    describe "monetize" do
      it { expect(bet).to monetize(:bet_amount_cents).as(:bet_amount) }
      it { expect(bet).to monetize(:prize_amount).as(:prize_amount) }
    end
  end
end
