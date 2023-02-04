class Vehicle < ApplicationRecord
  belongs_to :mode

  validates :mode_id, :plate, :brand, :model, :category, :year, :capacity, :status, presence: true

  enum status: { operational: 0, transit: 5, repair: 10 }
end
