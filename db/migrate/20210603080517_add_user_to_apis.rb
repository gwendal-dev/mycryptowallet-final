class AddUserToApis < ActiveRecord::Migration[6.0]
  def change
    add_reference :apis, :user, index: true
    add_foreign_key :apis, :users
  end
end
