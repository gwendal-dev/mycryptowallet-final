class RemovHideTohides < ActiveRecord::Migration[6.0]
  def change
    remove_column :hides, :hide, :integer
    add_column :hides, :hide, :boolean
  end
end
