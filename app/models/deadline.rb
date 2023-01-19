class Deadline < ApplicationRecord
  belongs_to :mode
  validates :min_distance, :max_distance, :deadline, :mode_id, presence: true
end
