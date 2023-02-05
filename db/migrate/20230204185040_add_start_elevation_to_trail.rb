class AddStartElevationToTrail < ActiveRecord::Migration[5.2]
  def change
    add_column :trails, :start_elevation, :string
  end
end
