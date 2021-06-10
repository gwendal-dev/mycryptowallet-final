class AddPriceToAlerts < ActiveRecord::Migration[6.0]
  def change
    add_column :alerts, :price, :integer
  end
end
