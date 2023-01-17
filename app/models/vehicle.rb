class Vehicle < ApplicationRecord
  belongs_to :mode

  validates :plate, :brand, :model, :category, :year, :capacity, presence: true
end
