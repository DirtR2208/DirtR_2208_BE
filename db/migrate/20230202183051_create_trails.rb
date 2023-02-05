class CreateTrails < ActiveRecord::Migration[5.2]
  def change
    create_table :trails do |t|
      t.string :name
      t.string :latitude
      t.string :longitude
      t.string :difficulty
      t.string :distance
      t.string :description

      t.timestamps
    end
  end
end
