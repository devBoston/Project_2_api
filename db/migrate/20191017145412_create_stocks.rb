class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.string :name
      t.date :purchase_on
      t.integer :start_price
      t.integer :end_price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
