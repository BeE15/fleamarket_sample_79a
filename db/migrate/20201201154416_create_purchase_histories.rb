class CreatePurchaseHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_histories do |t|
      t.references :product, foreign_key: true
      t.timestamps
    end
  end
end