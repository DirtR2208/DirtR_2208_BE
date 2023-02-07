class AddMapImageToTrail < ActiveRecord::Migration[5.2]
  def change
    add_column :trails, :map_image, :string
  end
end
