class Price < ApplicationRecord
  belongs_to :mode
  validates :min_weight, :max_weight, :price_per_km, :mode_id, presence: true
end
