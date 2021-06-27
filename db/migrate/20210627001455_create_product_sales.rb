class CreateProductSales < ActiveRecord::Migration[6.0]
  def change
    create_table :product_sales do |t|
      t.references :sale, null: false, foreign_key: true
      t.references :produto, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :total_product_price

      t.timestamps
    end
  end
end
