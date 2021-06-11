class Estoque < ApplicationRecord
  belongs_to :produto

  validates :quantidadeProduto, presence: true
  validates :valorTotalEstoque, presence: true
  validates_numericality_of :quantidadeProduto
  validates_numericality_of :valorTotalEstoque
end
