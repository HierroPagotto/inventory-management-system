class CreateProdutos < ActiveRecord::Migration[7.0]
  def change
    create_table :produtos do |t|
      t.string :nome, null: false
      t.text :descricao
      t.integer :quantidade_estoque, null: false, default: 0
      t.decimal :preco, precision: 10, scale: 2
      
      t.timestamps
    end
    
    add_index :produtos, :nome
  end
end