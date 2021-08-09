# == Schema Information
#
# Table name: rounds
#
#  id         :bigint           not null, primary key
#  color      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Round, type: :model do
  context "validation tests" do
    let(:round) { FactoryBot.build(:round) }

    it "has valid factory" do
      expect(round).to be_valid
    end

    describe "active model validations" do
      it { expect(round).to validate_presence_of(:color) }
      # it { expect(round).to validate_inclusion_of(:color).in_array(Round.colors.keys) }
      it { expect(round).to define_enum_for(:color).with_values([:green, :red, :black]) }
    end

    describe "active record associations" do
      it { expect(round).to have_many(:bets).dependent(:destroy) }
      it { expect(round).to have_many(:players).through(:bets) }
      it { expect(round).to accept_nested_attributes_for(:bets) }
    end
  end
end
