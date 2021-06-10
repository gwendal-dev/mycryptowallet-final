class CreateAlerts < ActiveRecord::Migration[6.0]
  def change
    create_table :alerts do |t|
      t.integer :value

      t.timestamps
    end
  end
end
