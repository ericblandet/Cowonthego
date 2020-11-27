class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :workspace

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :number_of_persons, presence: true

  NUMBER_OF_PERSONS = (1..10).to_a

  validate :valid_dates?


  def valid_dates?
    if end_date.present? && start_date.present? && end_date < start_date
      errors.add(:end_date, "can't be before start date")
    end
  end
end
