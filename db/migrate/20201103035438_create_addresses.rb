class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      # t.string :name, null:false, index:true 
      # t.text :text, null:false
      # t.string :brand
      # t.integer :status, null:false, default:0
      # t.integer :delivery_charge_bearer, null:false, default:0
      # t.integer :prefecture_id, null:false, default:0
      # t.integer :delivery_days, null:false, default:0
      # t.integer :price, null:false
      # # t.references :category, null: false, foreign_key: true
      # # t.references :buyer, foreign_key: {to_table: :users}
      # # t.references :seller, foreign_key:  {to_table: :users}
      # t.timestamps null:false
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :last_name_kana, null: false
      t.string :first_name_kana, null: false
      t.string :post_number, null:false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :house_number, null: false
      t.string :building_name
      t.string :phone_number
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
