class Address < ApplicationRecord
  belongs_to :customer

  validates :zip_code, presence: true, numericality: { only_integer: true }, length: {is: 8}
  validates :city, presence: true, length: {minimum: 3, too_short: "%{count} characters is the minimum allowed ", maximum:50, too_long: "%{count}characters is the maximum allowed " }
  validates :district, presence: true, length: {minimum: 3, too_short: "%{count} characters is the minimum allowed ", maximum:30, too_long: "%{count}characters is the maximum allowed " }
  validates :road, presence: true, length: {minimum: 3, too_short: "%{count} characters is the minimum allowed ", maximum:60, too_long: "%{count}characters is the maximum allowed " }
  validates :number, presence: true,  numericality: { only_integer: true }, length: {minimum: 1, too_short: "%{count} characters is the minimum allowed "}
  validates :complement, length: {maximum:50, too_long: "%{count}characters is the maximum allowed " }

end
