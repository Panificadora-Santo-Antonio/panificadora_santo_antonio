class Customer < ApplicationRecord
  has_one :address
  accepts_nested_attributes_for :address, allow_destroy: true

  validates :name, presence: true, presence: true, length: {minimum: 3, too_short: "%{count} characters is the minimum allowed ", maximum: 50, too_long: "%{count}characters is the maximum allowed " }
  validates :phone, presence: true, numericality: { only_integer: true }, length: {is: 11}
end
