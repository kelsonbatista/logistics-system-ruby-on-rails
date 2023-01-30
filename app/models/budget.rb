class Budget < ApplicationRecord
  belongs_to :order

  validates :mode, :total, :price_km, :fixed_fee, :deadline, presence: true
end
