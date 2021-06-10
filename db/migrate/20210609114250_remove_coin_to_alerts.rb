class RemoveCoinToAlerts < ActiveRecord::Migration[6.0]
  def change
    remove_column :alerts, :coin, :integer
    add_column :alerts, :coin, :float
  end
end
