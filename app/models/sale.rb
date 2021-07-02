class Sale < ApplicationRecord
    has_many :product_sale
    has_many :produto, through: :product_sale
    belongs_to :customer
    belongs_to :user
    validates :totalValue, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
end
