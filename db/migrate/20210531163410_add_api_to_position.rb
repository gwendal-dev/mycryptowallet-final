class AddApiToPosition < ActiveRecord::Migration[6.0]
  def change
    add_column :positions, :api, :integer
  end
end
