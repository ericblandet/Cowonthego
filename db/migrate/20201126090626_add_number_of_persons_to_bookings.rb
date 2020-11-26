class AddNumberOfPersonsToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :number_of_persons, :integer
  end
end
