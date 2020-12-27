class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :description, null: false
      t.string :status, null: false
      t.string :days, null: false
      t.string :shipping_cost, null: false
      t.references :size, foreign_key: true, null: false
      t.references :brand, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end