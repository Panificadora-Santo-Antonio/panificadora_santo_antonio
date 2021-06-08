class CreateProdutos < ActiveRecord::Migration[6.0]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.text :descrição
      t.decimal :preco
      t.date :validade

      t.timestamps
    end
  end
end
