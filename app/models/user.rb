class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: {minimum: 3, too_short: "%{count} characters is the minimum allowed ", maximum: 50, too_long: "%{count}characters is the maximum allowed " }
  validates :role, presence: true
  has_many :sale
end
