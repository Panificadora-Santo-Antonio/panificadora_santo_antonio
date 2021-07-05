class Customer < ApplicationRecord
  has_one :address
  accepts_nested_attributes_for :address, allow_destroy: true
  has_many :sales
  accepts_nested_attributes_for :sales, allow_destroy: true
  validates :name, presence: true, length: {minimum: 3, too_short: "%{count} caracteres é o mínimo permitido", maximum: 50, too_long: "%{count} caracteres é o máximo permitido" }
  validates :phone, presence: true, numericality: { only_integer: true }, length: {is: 11}
end
