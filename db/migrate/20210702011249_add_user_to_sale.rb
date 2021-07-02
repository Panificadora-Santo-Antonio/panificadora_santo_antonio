class AddUserToSale < ActiveRecord::Migration[6.0]
  def change
    add_reference :sales, :user, null: false, foreign_key: true
  end
end
