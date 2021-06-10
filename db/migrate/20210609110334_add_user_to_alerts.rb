class AddUserToAlerts < ActiveRecord::Migration[6.0]
  def change
    add_reference :alerts, :user, index: true
  end
end
