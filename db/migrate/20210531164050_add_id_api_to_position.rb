class AddIdApiToPosition < ActiveRecord::Migration[6.0]
  def change
    add_column :positions, :id_api, :integer
  end
end
