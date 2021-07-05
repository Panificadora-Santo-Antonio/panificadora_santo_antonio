class Address < ApplicationRecord
  belongs_to :customer

  validates :zip_code, presence: true, numericality: { only_integer: true }, length: {is: 8}
  validates :city, presence: true, length: {minimum: 3, too_short: "%{count} caracteres é o mínimo permitido", maximum:50, too_long: "%{count} caracteres é o máximo permitido" }
  validates :district, presence: true, length: {minimum: 3, too_short: "%{count} caracteres é o mínimo permitido", maximum:30, too_long: "%{count} caracteres é o máximo permitido" }
  validates :road, presence: true, length: {minimum: 3, too_short: "%{count} caracteres é o mínimo permitido", maximum:60, too_long: "%{count} caracteres é o máximo permitido" }
  validates :number, presence: true,  numericality: { only_integer: true }, length: {minimum: 1, too_short: "%{count} caracteres é o mínimo permitido"}
  validates :complement, length: {maximum:50, too_long: "%{count} caracteres é o mínimo permitido" }

end
