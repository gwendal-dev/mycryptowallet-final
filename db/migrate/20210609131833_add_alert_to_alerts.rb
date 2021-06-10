class AddAlertToAlerts < ActiveRecord::Migration[6.0]
  def change
    add_column :alerts, :alert, :boolean
  end
end
