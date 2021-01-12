class AddReferencesToProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :user, null: false, foreign_key: true
    add_reference :products, :size, foreign_key: true
    add_reference :products, :brand, foreign_key: true
  end
end
