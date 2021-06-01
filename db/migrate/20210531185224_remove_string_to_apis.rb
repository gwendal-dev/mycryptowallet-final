class RemoveStringToApis < ActiveRecord::Migration[6.0]
  def change
    remove_column :apis, :"{:null=>false, :foreign_key=>true}_id"
  end
end
