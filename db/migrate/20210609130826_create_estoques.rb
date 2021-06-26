class CreateEstoques < ActiveRecord::Migration[6.0]
  def change
    create_table :estoques do |t|
      t.integer :quantidadeProduto
      t.decimal :valorTotalEstoque
      t.references :produto, null: false, foreign_key: true

      t.timestamps
    end
  end
end
