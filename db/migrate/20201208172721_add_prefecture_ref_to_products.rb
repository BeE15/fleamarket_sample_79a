class AddPrefectureRefToProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :prefecture, null: false, foreign_key: true
  end
end
