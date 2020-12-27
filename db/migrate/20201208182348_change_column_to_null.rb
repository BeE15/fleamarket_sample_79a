class ChangeColumnToNull < ActiveRecord::Migration[6.0]
  def up
    change_column_null :products, :brand_id, true
    change_column_null :products, :size_id, true
  end

  def down
    change_column_null :products, :brand_id, false
    change_column_null :products, :size_id, false
  end
end
