class Product < ApplicationRecord
  has_many :order_products, dependent: :destroy
  has_many :orders, through: :order_products

  validates :code, :width, :height, :depth, :weight, presence: true

  before_validation :generate_code, on: :create

  private

  def generate_code
    self.code = SecureRandom.uuid
  end
end
