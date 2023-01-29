class Vehicle < ApplicationRecord
  belongs_to :mode

  validates :plate, :brand, :model, :category, :year, :capacity, presence: true

  enum status: { in_operation: 0, in_transit: 5, in_maintenance: 10 }
end
