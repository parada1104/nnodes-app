# == Schema Information
#
# Table name: rounds
#
#  id         :bigint           not null, primary key
#  color      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Round < ApplicationRecord
  enum color: { green: 0, red: 1, black: 2 }

  ##associations
  has_many :bets, dependent: :destroy
  has_many :players, through: :bets

  ##validations
  validates :color, presence: true, inclusion: { in: Round.colors.keys }
end
