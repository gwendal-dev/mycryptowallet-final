class RemoveIntegerToCoins < ActiveRecord::Migration[6.0]
  def change
    remove_column :coins, :marketcap, :integer
    add_column :coins, :marketcap, :string
  end
end
