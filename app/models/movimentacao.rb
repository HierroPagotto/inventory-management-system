class Movimentacao < ApplicationRecord
  belongs_to :produto
  
  validates :tipo, presence: true, inclusion: { in: %w[entrada saida] }
  validates :quantidade, presence: true, numericality: { greater_than: 0 }
  validates :data_movimentacao, presence: true
  
  before_create :atualizar_estoque_produto
  
  scope :entradas, -> { where(tipo: 'entrada') }
  scope :saidas, -> { where(tipo: 'saida') }
  scope :por_data, -> { order(data_movimentacao: :desc) }
  
  private
  
  def atualizar_estoque_produto
    produto.atualizar_estoque!(tipo, quantidade)
  end
end