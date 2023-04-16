class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nome, :string
    add_column :users, :dinheiro_atual, :string
    add_column :users, :renda_fixa, :string
    add_column :users, :gastos_fixos, :string
    add_column :users, :renda_nao_fixa, :string
    add_column :users, :gastos_nao_fixos, :string
  end
end
