class AddAvgDurationToTrail < ActiveRecord::Migration[5.2]
  def change
    add_column :trails, :avg_duration, :string
  end
end
