class Tyre < ApplicationRecord
  belongs_to :hemm
  POSITIONS=%w[FL FR RL RR RLO RLI RRI RRO].freeze
  validates :position, presence: true
  validates :position, inclusion: { in: POSITIONS }
  validates :pressure, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 150
  },
            allow_nil: true
  validates :sensor_id,uniqueness: true,allow_blank: true
end
