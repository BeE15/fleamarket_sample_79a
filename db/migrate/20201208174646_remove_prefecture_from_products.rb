class RemovePrefectureFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_reference :products, :prefecture, null: false, foreign_key: true
  end
end
