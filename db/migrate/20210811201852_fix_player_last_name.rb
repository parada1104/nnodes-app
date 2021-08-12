class FixPlayerLastName < ActiveRecord::Migration[6.1]
  def change
    rename_column :players, :lastName, :last_name
  end
end
