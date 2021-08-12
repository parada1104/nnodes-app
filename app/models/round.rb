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
class Round < ApplicationRecord
  enum color: { green: 0, red: 1, black: 2 }

  ##associations
  has_many :bets, dependent: :destroy
  has_many :players, through: :bets
  accepts_nested_attributes_for :bets

  ##validations
  validates :color, presence: true

  def set_color
    probabilities = [
      { color: Round.colors["green"], probability: 0.02 },
      { color: Round.colors["red"], probability: 0.49 },
      { color: Round.colors["black"], probability: 1.00 },
    ]
    random_selection = rand()
    puts random_selection
    selection = probabilities.each do |p|
      if random_selection < p[:probability]
        self.color = p[:color]
        break
      end
    end
  end
end
