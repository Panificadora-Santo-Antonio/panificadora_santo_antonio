class Produto < ApplicationRecord

  validates :nome, presence: true, length:{maximum: 50}
  validates :descrição, length:{maximum: 200}
  validates :preco, presence: true, :numericality => true
  validates_datetime :validade, after: :today 
  has_one :estoque, dependent: :destroy
  accepts_nested_attributes_for :estoque
end
