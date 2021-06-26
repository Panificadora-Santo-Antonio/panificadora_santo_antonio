class CreateProductSales < ActiveRecord::Migration[6.0]
  def change
    create_table :product_sales do |t|
      t.integer :quantity
      t.decimal :totalProductPrice

      t.timestamps
    end
  end
end
