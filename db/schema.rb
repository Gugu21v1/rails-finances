# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_18_124452) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gastos_fixos", force: :cascade do |t|
    t.string "nome"
    t.string "valor", default: "0"
    t.string "data"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "feito", default: false
    t.index ["user_id"], name: "index_gastos_fixos_on_user_id"
  end

  create_table "goals", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "nome"
    t.string "desc"
    t.string "valor"
    t.string "tempo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "feito", default: false
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "renda_fixas", force: :cascade do |t|
    t.string "nome"
    t.string "valor", default: "0"
    t.string "data"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "feita", default: false
    t.index ["user_id"], name: "index_renda_fixas_on_user_id"
  end

  create_table "transitions", force: :cascade do |t|
    t.string "tipo"
    t.string "valor"
    t.string "data"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nome"
    t.index ["user_id"], name: "index_transitions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nome"
    t.string "dinheiro_atual", default: "0"
    t.string "renda_fixa", default: "0"
    t.string "gastos_fixos", default: "0"
    t.string "renda_nao_fixa", default: "0"
    t.string "gastos_nao_fixos", default: "0"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "gastos_fixos", "users"
  add_foreign_key "goals", "users"
  add_foreign_key "renda_fixas", "users"
  add_foreign_key "transitions", "users"
end
