class AddCountyToTrails < ActiveRecord::Migration[5.2]
  def change
    add_reference :trails, :county, foreign_key: true
  end
end
