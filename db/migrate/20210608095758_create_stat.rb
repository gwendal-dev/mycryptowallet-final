class CreateStat < ActiveRecord::Migration[6.0]
  def change
    create_table :stats do |t|
      t.integer :position
      t.bigint :time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
