class CreateBets < ActiveRecord::Migration[6.1]
  def change
    create_table :bets do |t|
      t.references :player, null: false, foreign_key: true, index: true
      t.references :round, null: false, foreign_key: true, index: true
      t.integer :betColor, null: false
      t.monetize :betAmount, null: false
      t.monetize :prizeAmount, null: false
      t.index [:player_id, :round_id], unique: true

      t.timestamps
    end
  end
end
