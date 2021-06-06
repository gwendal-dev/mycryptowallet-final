class ChangeMarketcapTocoins < ActiveRecord::Migration[6.0]
  def change
    change_column :coins, :marketcap, :bigint
  end
end
