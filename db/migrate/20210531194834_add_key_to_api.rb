class AddKeyToApi < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :positions, :apis
  end
end
