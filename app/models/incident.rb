class Incident < ApplicationRecord

  belongs_to :user
  has_many :comments
  has_many :users, through: :affecting_pins

  validates :location, presence: true
  validates :category, presence: true, inclusion: { in: ['Accident', 'Construction', 'Structural'] }
  validates :description, presence: true
  validates :status, inclusion: { in: ['resolved', 'unresolved'] }
end

