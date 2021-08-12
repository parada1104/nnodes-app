class FixBetsColumnsNames < ActiveRecord::Migration[6.1]
  def change
    rename_column :bets, :betAmount_cents, :bet_amount_cents
    rename_column :bets, :betAmount_currency, :bet_amount_currency
    rename_column :bets, :prizeAmount_cents, :prize_amount_cents
    rename_column :bets, :prizeAmount_currency, :prize_amount_currency
    rename_column :bets, :betColor, :color
  end
end
