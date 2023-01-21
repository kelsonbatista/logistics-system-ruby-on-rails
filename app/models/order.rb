class Order < ApplicationRecord
  has_many :order_addresses, dependent: :destroy
  has_many :addresses, through: :order_addresses
  has_many :products, dependent: :destroy

  enum status: { pending: 0, waiting: 1, sent: 2, delivered: 3, canceled: 4, returned: 5 }
end
