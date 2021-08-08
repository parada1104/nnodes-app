class CreateRounds < ActiveRecord::Migration[6.1]
  def change
    create_table :rounds do |t|
      t.integer :color, null: false

      t.timestamps
    end
  end
end
