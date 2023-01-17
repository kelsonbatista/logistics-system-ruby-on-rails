class Mode < ApplicationRecord
  has_many :vehicles
  validates :name, :min_distance, :max_distance, :min_weight, :max_weight, :fixed_fee, presence: true
  validates :name, uniqueness: true
end
