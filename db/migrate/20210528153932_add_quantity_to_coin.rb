class AddQuantityToCoin < ActiveRecord::Migration[6.0]
  def change
    add_column :coins, :quantity, :integer
  end
end
