class Order < ApplicationRecord
  has_many :order_addresses, dependent: :destroy
  has_many :addresses, through: :order_addresses
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  accepts_nested_attributes_for :addresses, allow_destroy: true
  accepts_nested_attributes_for :products, allow_destroy: true

  enum status: { pending: 0, waiting: 1, sent: 2, delivered: 3, canceled: 4, returned: 5 }

  enum state: [ :AC, :AL, :AP, :AM, :BA, :CE, :DF, :ES, :GO, :MA, :MT, :MS, :MG, :PA, :PB, :PR, :PE, :PI, :RJ, :RN, :RS, :RO, :RR, :SC, :SP, :SE, :TO ]

  validates :distance, :status, presence: true
  # validates :person, :address_one, :address_two, :city, :state, :zip, presence: true
  # validates :addresses, presence: true
  # validates :products, presence: true
  # validates_associated :order_addresses
  # validates :order_products, associated: true

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
