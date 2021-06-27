class Sale < ApplicationRecord
    has_many :product_sale
    has_many :produto, through: :product_sale
    belongs_to :customer
end
