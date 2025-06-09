class Movimentacao < ApplicationRecord
  belongs_to :produto
  
  validates :tipo, presence: true, inclusion: { in: %w[entrada saida] }
  validates :quantidade, presence: true, numericality: { greater_than: 0 }
  validates :data_movimentacao, presence: true
  
  before_save :atualizar_estoque_produto, if: :new_record?
  
  scope :entradas, -> { where(tipo: 'entrada') }
  scope :saidas, -> { where(tipo: 'saida') }
  scope :por_data, -> { order(data_movimentacao: :desc) }
  
  private
  
  def atualizar_estoque_produto
    case tipo
    when 'entrada'
      produto.quantidade_estoque += quantidade
    when 'saida'
      raise 'Estoque insuficiente' if produto.quantidade_estoque < quantidade
      produto.quantidade_estoque -= quantidade
    end
  end
end
