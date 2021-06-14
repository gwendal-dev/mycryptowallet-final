class AddDescriptionToCoins < ActiveRecord::Migration[6.0]
  def change
    add_column :coins, :description, :string
  end
end
