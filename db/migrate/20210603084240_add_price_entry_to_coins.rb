class AddPriceEntryToCoins < ActiveRecord::Migration[6.0]
  def change
    add_column :coins, :price_entry, :integer
  end
end
