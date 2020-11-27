class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :workspace

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :number_of_persons, presence: true
  
  
  validate :valid_dates?
  
  NUMBER_OF_PERSONS = (1..10).to_a
  
  def valid_dates?
    end_date >= start_date
  end
end
