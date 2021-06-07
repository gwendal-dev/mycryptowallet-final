class AddColulsTocoins < ActiveRecord::Migration[6.0]
  def change
    add_column :coins, :max_supply, :bigint
    add_column :coins, :volume, :bigint
  end
end
