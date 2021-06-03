class AddHidetable < ActiveRecord::Migration[6.0]
  def change
    create_table :hides do |t|
      t.integer :hide

      t.timestamps
    end
  end
end
