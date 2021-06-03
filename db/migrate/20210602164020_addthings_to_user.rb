class AddthingsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :stripe_id, :string
    add_column :users, :card_brand, :string
  end
end
