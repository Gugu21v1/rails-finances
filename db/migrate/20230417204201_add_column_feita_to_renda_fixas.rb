class AddColumnFeitaToRendaFixas < ActiveRecord::Migration[7.0]
  def change
    add_column :renda_fixas, :feita, :boolean, default: false
  end
end
