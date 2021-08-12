class AddStartedAtToRounds < ActiveRecord::Migration[6.1]
  def change
    add_column :rounds, :started_at, :timestamp
    add_column :rounds, :finished_at, :timestamp
  end
end
