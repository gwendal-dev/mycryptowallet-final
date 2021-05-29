class AddQuantityFloatToCoins < ActiveRecord::Migration[6.0]
  def change
    remove_column :coins, :quantity, :integer
    add_column :coins, :quantity, :float
  end
end
