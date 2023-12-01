class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :comments
  has_many :affecting_pins
  has_many :incidents, through: :affecting_pins
  has_many :incidents

  def affecting_incidents
    Incident.joins(:affecting_pins).where(affecting_pins: { user_id: id })
  end
end
