class Estoque < ApplicationRecord
  belongs_to :produto

  validates :quantidadeProduto, presence: true, :numericality => { :greater_than_or_equal_to => 1}
  validates :valorTotalEstoque, presence: true
  validates_numericality_of :quantidadeProduto
  validates_numericality_of :valorTotalEstoque
end
