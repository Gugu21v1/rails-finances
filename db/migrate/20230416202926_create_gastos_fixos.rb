class CreateGastosFixos < ActiveRecord::Migration[7.0]
  def change
    create_table :gastos_fixos do |t|
      t.string :nome
      t.string :valor, default: "0"
      t.string :data
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
