class RemoveEntryToPositions < ActiveRecord::Migration[6.0]
  def change
    remove_column :positions, :price_entry, :integer
    add_column :positions, :price_entry, :float
  end
end
