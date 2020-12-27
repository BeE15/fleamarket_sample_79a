class RemoveSizeFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :size, :string
  end
end
