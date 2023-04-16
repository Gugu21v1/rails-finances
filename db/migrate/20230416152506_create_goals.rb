class CreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :goals do |t|
      t.references :user, null: false, foreign_key: true
      t.string :nome
      t.string :desc
      t.string :valor
      t.string :tempo

      t.timestamps
    end
  end
end
