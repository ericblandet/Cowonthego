class Workspace < ApplicationRecord
  belongs_to :user
  validates :name, :description, :address, :capacity, :daily_rate, presence: true
  validates :daily_rate, numericality: { greater_than: 0 }
  validates :capacity, numericality: { only_integer: true }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :bookings, dependent: :destroy
  has_one_attached :photo
end
