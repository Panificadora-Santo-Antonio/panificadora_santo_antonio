class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: {minimum: 3, too_short: "%{count} caracteres é o mínimo permitido", maximum: 50, too_long: "%{count} caracteres é o máximo permitido" }
  validates :role, presence: true
  has_many :sale
end
