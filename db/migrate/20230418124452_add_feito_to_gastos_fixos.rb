class AddFeitoToGastosFixos < ActiveRecord::Migration[7.0]
  def change
    add_column :gastos_fixos, :feito, :boolean, default: false
  end
end
