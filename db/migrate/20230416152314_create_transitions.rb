class CreateTransitions < ActiveRecord::Migration[7.0]
  def change
    create_table :transitions do |t|
      t.string :tipo
      t.string :valor
      t.string :data
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
