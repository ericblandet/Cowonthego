class AddCoordinatesToWorkspaces < ActiveRecord::Migration[6.0]
  def change
    add_column :workspaces, :latitude, :float
    add_column :workspaces, :longitude, :float
  end
end
