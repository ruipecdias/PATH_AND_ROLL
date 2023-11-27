class Incident < ApplicationRecord
  # other associations
  has_many :affecting_pins
  has_many :users, through: :affected_pins
end