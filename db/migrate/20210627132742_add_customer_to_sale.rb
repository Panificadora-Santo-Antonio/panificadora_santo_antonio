class AddCustomerToSale < ActiveRecord::Migration[6.0]
  def change
    add_reference :sales, :customer, null: false, foreign_key: true
  end
end
