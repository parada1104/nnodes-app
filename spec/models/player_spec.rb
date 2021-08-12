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
require 'rails_helper'

RSpec.describe Player, type: :model do
  context "validation tests" do
    let(:player) { FactoryBot.build(:player) }

    it "has a valid factory" do
      expect(player).to be_valid
    end

    describe "active model validations" do
      it { expect(player).to validate_presence_of(:name) }
      it { expect(player).to validate_presence_of(:last_name) }
      it { expect(player).to validate_numericality_of(:balance) }
    end

    describe "active record associations" do
      it { expect(player).to have_many(:bets).dependent(:destroy) }
      it { expect(player).to have_many(:rounds).through(:bets) }
      it { expect(player).to accept_nested_attributes_for(:bets) }
    end

    describe "monetize validations" do
      it { expect(player).to monetize(:balance_cents).as(:balance) }
    end
  end
end
