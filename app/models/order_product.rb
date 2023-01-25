class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  accepts_nested_attributes_for :product, allow_destroy: true

  validates_associated :product
end
