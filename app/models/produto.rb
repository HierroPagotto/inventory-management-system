class Produto < ApplicationRecord
  has_many :movimentacoes, class_name: 'Movimentacao', dependent: :destroy
  
  validates :nome, presence: true
  validates :quantidade_estoque, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :preco, numericality: { greater_than: 0 }, allow_blank: true
  
  def atualizar_estoque!(tipo, quantidade)
    case tipo
    when 'entrada'
      self.quantidade_estoque += quantidade
    when 'saida'
      raise 'Estoque insuficiente' if self.quantidade_estoque < quantidade
      self.quantidade_estoque -= quantidade
    end
    save!
  end
end