class AddApiToPositions < ActiveRecord::Migration[6.0]
  def change
    remove_column :positions, :api, :integer
    remove_column :positions, :id_api, :integer
    add_reference :apis, null: false, foreign_key: true
  end
end
