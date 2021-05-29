class AddApiKeyToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :api_key, :string
    add_column :users, :api_secret, :string
  end
end
