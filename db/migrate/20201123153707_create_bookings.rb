class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :users, null: false, foreign_key: true
      t.references :workspaces, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.float :total_price

      t.timestamps
    end
  end
end
