class CreatePositions < ActiveRecord::Migration[6.0]
  def change
    create_table :positions do |t|
      t.references :portfolio, null: false, foreign_key: true
      t.references :coin, null: false, foreign_key: true
      t.date :entry_date
      t.float :amount
      t.float :quantity
      t.date :exit_date
      t.string :exchange

      t.timestamps
    end
  end
end
