class ProductSale < ApplicationRecord
    belongs_to :produto
    belongs_to :sale
    validates :quantity, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
end
