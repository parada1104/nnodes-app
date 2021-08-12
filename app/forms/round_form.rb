class RoundForm
  include ActiveModel::Model

  def save!
    ActiveRecord::Base.transaction do
      @round = Round.new
      @round.set_color
    end
  end

  def persist!
    @players = Player.active_players
    self.save!
    if @round.save!
      @players.each do |player|
        bet = Bet.create(player: player,round: @round)
        bet.perform_bet
        new_balance = player.balance - bet.bet_amount + bet.prize_amount
        if bet.save!
          player.update(balance: new_balance)
        end
      end
    else 
      false
    end
  end
end
