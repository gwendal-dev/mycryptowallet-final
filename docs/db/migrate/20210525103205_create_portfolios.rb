class CreatePortfolios < ActiveRecord::Migration[6.0]
  def change
    create_table :portfolios do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true
      t.float :total

      t.timestamps
    end
  end
end
