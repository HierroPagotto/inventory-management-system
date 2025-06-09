class CreateMovimentacoes < ActiveRecord::Migration[7.0]
  def change
    create_table :movimentacoes do |t|
      t.references :produto, null: false, foreign_key: true
      t.string :tipo, null: false
      t.integer :quantidade, null: false
      t.date :data_movimentacao, null: false
      
      t.timestamps
    end
    
    add_index :movimentacoes, [:produto_id, :data_movimentacao]
    add_index :movimentacoes, :tipo
  end
end