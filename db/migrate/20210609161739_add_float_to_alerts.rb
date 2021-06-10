class AddFloatToAlerts < ActiveRecord::Migration[6.0]
  def change
    remove_column :alerts, :price, :integer
    remove_column :alerts, :new_price, :integer
    add_column :alerts, :price, :float
    add_column :alerts, :new_price, :float
  end
end
