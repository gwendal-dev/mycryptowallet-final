class AddReferenceToPosition < ActiveRecord::Migration[6.0]
  def change
    add_reference :positions, :api, index: true
  end
end
