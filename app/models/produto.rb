class Produto < ApplicationRecord
  has_one :estoque, dependent: :destroy
  accepts_nested_attributes_for :estoque
end
