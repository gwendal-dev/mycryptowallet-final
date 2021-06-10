class RemoveValueFromAlerts < ActiveRecord::Migration[6.0]
  def change
    remove_column :alerts, :coin, :float
    add_column :alerts, :coin, :string
    remove_column :alerts, :value, :integer
    add_column :alerts, :value, :float
  end
end
