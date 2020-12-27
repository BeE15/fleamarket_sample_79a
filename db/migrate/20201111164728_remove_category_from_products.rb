class RemoveCategoryFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_reference :products, :category, null: false, foreign_key: true
  end
end
