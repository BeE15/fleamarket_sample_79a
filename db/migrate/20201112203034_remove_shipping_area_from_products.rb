class RemoveShippingAreaFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :shipping_area, :string
  end
end
