class Incident < ApplicationRecord

  belongs_to :user
  has_many :affecting_pins
  has_many :comments, dependent: :destroy
  has_many :users, through: :affecting_pins

  validates :location, presence: true
  validates :category, presence: true, inclusion: { in: ['Accident', 'Construction', 'Structural'] }
  validates :description, presence: true
  enum status: { unresolved: false, resolved: true }

  validates :status, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def has_pins_by_user?(user)
    self.affecting_pins.where(user: user).present?
  end
end
