class RemoveReferencesUserAndWorkspaceFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_reference :bookings, :users, index: true, foreign_key: true
    remove_reference :bookings, :workspaces, index: true, foreign_key: true
  end
end
