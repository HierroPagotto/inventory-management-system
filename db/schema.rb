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

ActiveRecord::Schema[8.0].define(version: 2024_01_01_000002) do
  create_table "movimentacoes", force: :cascade do |t|
    t.integer "produto_id", null: false
    t.string "tipo", null: false
    t.integer "quantidade", null: false
    t.date "data_movimentacao", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produto_id", "data_movimentacao"], name: "index_movimentacoes_on_produto_id_and_data_movimentacao"
    t.index ["produto_id"], name: "index_movimentacoes_on_produto_id"
    t.index ["tipo"], name: "index_movimentacoes_on_tipo"
  end

  create_table "produtos", force: :cascade do |t|
    t.string "nome", null: false
    t.text "descricao"
    t.integer "quantidade_estoque", default: 0, null: false
    t.decimal "preco", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nome"], name: "index_produtos_on_nome"
  end

  add_foreign_key "movimentacoes", "produtos"
end
