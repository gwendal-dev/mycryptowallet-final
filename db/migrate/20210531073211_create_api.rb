class CreateApi < ActiveRecord::Migration[6.0]
  def change
    create_table :apis do |t|
      t.string :key
      t.string :secret_key
      t.string :exchange

      t.timestamps
    end
  end
end

