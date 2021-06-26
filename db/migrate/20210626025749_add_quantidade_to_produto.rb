class AddQuantidadeToProduto < ActiveRecord::Migration[6.0]
  def change
    add_column :produtos, :quantidade, :integer
  end
end
