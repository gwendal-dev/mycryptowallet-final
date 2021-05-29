class AddCahngeToCoins < ActiveRecord::Migration[6.0]
  def change
    add_column :coins, :change, :float
  end
end
