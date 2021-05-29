class AddMarketcapToCoins < ActiveRecord::Migration[6.0]
  def change
    add_column :coins, :marketcap, :integer
  end
end
