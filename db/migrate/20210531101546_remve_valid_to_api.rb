class RemveValidToApi < ActiveRecord::Migration[6.0]
  def change
    remove_column :apis, :valid, :integer
    add_column :apis, :valid_api, :integer
  end
end
