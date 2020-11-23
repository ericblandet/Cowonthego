class Booking < ApplicationRecord
  belongs_to :users
  belongs_to :workspaces
  validates :start_date, :end_date, presence: true
end
