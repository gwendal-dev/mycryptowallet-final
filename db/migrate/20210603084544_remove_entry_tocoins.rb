class RemoveEntryTocoins < ActiveRecord::Migration[6.0]
  def change
    remove_column :coins, :price_entry, :integer
    add_column :positions, :price_entry, :integer
  end
end
