class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.decimal :totalValue
      t.datetime :date_time

      t.timestamps
    end
  end
end
