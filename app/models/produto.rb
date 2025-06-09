class Produto < ApplicationRecord
  has_many :movimentacoes, dependent: :destroy
  
  validates :nome, presence: true
  validates :quantidade_estoque, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :preco, numericality: { greater_than: 0 }, allow_blank: true
end
