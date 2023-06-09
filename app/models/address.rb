class Address < ApplicationRecord
  has_many :order_addresses, dependent: :destroy
  has_many :orders, through: :order_addresses

  validates :person, :address_one, :city, :state, :zip, presence: true
end
