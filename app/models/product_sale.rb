class ProductSale < ApplicationRecord
    belongs_to :produto
    belongs_to :sale

end
