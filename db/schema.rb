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
