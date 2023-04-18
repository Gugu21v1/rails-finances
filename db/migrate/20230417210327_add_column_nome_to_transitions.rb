class AddColumnNomeToTransitions < ActiveRecord::Migration[7.0]
  def change
    add_column :transitions, :nome, :string
  end
end
