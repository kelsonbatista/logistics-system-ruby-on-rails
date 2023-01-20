class Address < ApplicationRecord
  has_many :order_addresses, dependent: :destroy
  has_many :orders, through: :order_addresses
end
