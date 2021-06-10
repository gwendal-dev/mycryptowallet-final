class AddDEfaultValueToAlerts < ActiveRecord::Migration[6.0]
  def change
    remove_column :alerts, :alert, :boolean
    add_column :alerts, :alert, :boolean, :default => false
  end
end
