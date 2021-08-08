class CreatePlayers < ActiveRecord::Migration[6.1]

  def change
    create_table :players do |t|
      t.string :name, null: false
      t.string :lastName, null: false
      t.monetize :balance , amount: {null: false, default: 100*10000}

      t.timestamps
    end
  end
end
