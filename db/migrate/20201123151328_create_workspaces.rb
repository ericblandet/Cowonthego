class CreateWorkspaces < ActiveRecord::Migration[6.0]
  def change
    create_table :workspaces do |t|
      t.string :name
      t.string :description
      t.string :address
      t.integer :capacity
      t.float :daily_rate
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
