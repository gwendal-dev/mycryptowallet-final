class ChangePositiontoStats < ActiveRecord::Migration[6.0]
  def change
    remove_column :stats, :position, :integer
    add_column :stats, :position, :float
  end
end
