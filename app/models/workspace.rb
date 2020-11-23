class Workspace < ApplicationRecord
  belongs_to :user
  validates :name, :description, :address, :capacity, :daily_rate, presence: true
  validates :daily_rate, numericality: { greater_than: 0 }
  validates :capacity, numericality: { only_integer: true }

  has_many :bookings
end
