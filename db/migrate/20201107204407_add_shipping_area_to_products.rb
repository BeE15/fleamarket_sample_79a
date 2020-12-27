class AddShippingAreaToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :shipping_area, :string
  end
end
