class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :workspace

  validates :start_date, :end_date, :number_of_persons, presence: true

  NUMBER_OF_PERSONS = (1..10).to_a
end
