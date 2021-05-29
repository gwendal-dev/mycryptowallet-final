class AddImageToCoins < ActiveRecord::Migration[6.0]
  def change
    add_column :coins, :avatar, :string
  end
end
