class RenameTelefoneToPhone < ActiveRecord::Migration[6.0]
  def change
    rename_column :customers, :telefone, :phone
  end
end
