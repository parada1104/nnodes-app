class BalanceRechargeWorker
  include Sidekiq::Worker
  RECHARGE_IN_SECONDS = 10_000_00

  def perform(*args)
    Player.all.each do |player|
      player.update_attribute(balance: player.balance + RECHARGE_IN_SECONDS )
    end
  end
end
