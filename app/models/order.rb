class Order < ApplicationRecord
  has_many :order_addresses, dependent: :destroy
  has_many :addresses, through: :order_addresses
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products
  has_one :budgets, dependent: :destroy

  accepts_nested_attributes_for :addresses, allow_destroy: true
  accepts_nested_attributes_for :order_products, allow_destroy: true

  enum status: { open:0, pending: 3, sent: 5, delivered: 10, canceled: 15, returned: 20 }

  enum state: [ :AC, :AL, :AP, :AM, :BA, :CE, :DF, :ES, :GO, :MA, :MT, :MS, :MG, :PA, :PB, :PR, :PE, :PI, :RJ, :RN, :RS, :RO, :RR, :SC, :SP, :SE, :TO ]

  validates :distance, :status, presence: true
  validates_associated :order_products

  before_validation :generate_code, on: :create

  private

  def generate_code
    self.code = SecureRandom.alphanumeric(15).upcase
  end

  def addresses_attributes=(addresses_attributes)
    addresses_attributes.values.each do |address_attributes|
      self.addresses.build(address_attributes)
    end
  end
end
