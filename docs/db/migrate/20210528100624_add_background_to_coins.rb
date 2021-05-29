class AddBackgroundToCoins < ActiveRecord::Migration[6.0]
  def change
    add_column :coins, :background, :string
  end
end
