class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :zip_code
      t.string :city
      t.string :district
      t.string :road
      t.integer :number
      t.string :complement
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
