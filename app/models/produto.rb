class Produto < ApplicationRecord

  validates :nome, presence: true, length:{minimum: 3,maximum: 50}
  validates :descricao, length:{maximum: 200}
  validates :preco, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
  validates_datetime :validade, after: :today
  validates :quantidade, presence: true, :numericality => { :greater_than_or_equal_to => 0 }

  has_many :product_sale
  has_many :sales, through: :product_sale
end
