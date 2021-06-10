class AddCoinToAlerts < ActiveRecord::Migration[6.0]
  def change
    add_column :alerts, :coin, :string
  end
end
