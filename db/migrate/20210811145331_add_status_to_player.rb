class AddStatusToPlayer < ActiveRecord::Migration[6.1]
  def change
    add_column :players, :status, :integer, default: 1, null: false
  end
end
