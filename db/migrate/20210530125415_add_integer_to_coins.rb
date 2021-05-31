class AddIntegerToCoins < ActiveRecord::Migration[6.0]
  def change
    remove_column :coins, :marketcap, :string
    add_column :coins, :marketcap, :integer
  end
end
