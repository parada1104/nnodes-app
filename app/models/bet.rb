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
class Bet < ApplicationRecord
  enum color: { green: 0, red: 1, black: 2 }
  MINIMUN_TO_SET_BET_IN_CENTS = 1_000_00

  ##associations
  belongs_to :player
  belongs_to :round

  #money
  monetize :bet_amount_cents, as: :bet_amount, allow_nil: false
  monetize :prize_amount_cents, as: :prize_amount, allow_nil: true

  ##validations
  validates :player, presence: true, uniqueness: { scope: :round_id, message: "you can't bet more than once per round" }
  validates :round, presence: true
  validates :color, presence: true
  validates :bet_amount, presence: true, numericality: true
  validates :prize_amount, presence: true, numericality: true

  delegate :full_name, to: :player, prefix: :player

  def perform_bet
    self.set_color
    self.set_prize
  end

  private
  def set_color
    probabilities = [
      { color: Bet.colors["green"], probability: 0.02 },
      { color: Bet.colors["red"], probability: 0.49 },
      { color: Bet.colors["black"], probability: 1.00 },
    ]
    random_selection = rand()
    probabilities.each do |p|
      return self.color = p[:color] if random_selection < p[:probability]
    end
  end

  def calculate_bet_amount
    redis = Redis.new
    be_conservative = redis.get("be_conservative")
    unless self.player.balance < Money.new(MINIMUN_TO_SET_BET_IN_CENTS)
      puts Money.new(MINIMUN_TO_SET_BET_IN_CENTS)
      if be_conservative.to_i == 1
        random_bet_percentage = rand(0.03...0.07)
        return self.player.balance * random_bet_percentage
      else
        random_bet_percentage = rand(0.08...0.15)
        return self.player.balance * random_bet_percentage
      end
    end
    return self.player.balance
  end

  def set_prize
    self.bet_amount = calculate_bet_amount
    if self.round.color.to_s == self.color.to_s
      case self.color.to_s
      when "green" 
        self.prize_amount = self.bet_amount * 15
      when "red","black"
        self.prize_amount = self.bet_amount * 2
      end
    end
  end
end
