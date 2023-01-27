class OrderAddress < ApplicationRecord
  belongs_to :order
  belongs_to :address

  accepts_nested_attributes_for :address, allow_destroy: true
  # validates :order, :address, presence: true
end
