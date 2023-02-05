class AddThumbnailImageToTrail < ActiveRecord::Migration[5.2]
  def change
    add_column :trails, :thumbnail_image, :string
  end
end
