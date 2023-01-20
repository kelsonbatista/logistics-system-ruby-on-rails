class Order < ApplicationRecord
  has_many :order_addresses, dependent: :destroy
  has_many :addresses, through: :order_addresses
  has_many :products, dependent: :destroy
end
