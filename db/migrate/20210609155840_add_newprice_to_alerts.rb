class AddNewpriceToAlerts < ActiveRecord::Migration[6.0]
  def change
    add_column :alerts, :new_price, :integer
  end
end
