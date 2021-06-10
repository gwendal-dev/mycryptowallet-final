class AddforeignKeyToAlerts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :alerts, :users
  end
end
