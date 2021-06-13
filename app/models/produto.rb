class Produto < ApplicationRecord

  validates :nome, presence: true, length:{maximum: 50}
  validates :descrição, length:{maximum: 200}
  validates :preco, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
  validates_datetime :validade, after: :today 
  has_one :estoque, dependent: :destroy
  accepts_nested_attributes_for :estoque
end
