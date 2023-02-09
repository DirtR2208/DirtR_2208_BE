class UserTrailsSerializer
  include JSONAPI::Serializer

  set_id {nil}
  attributes :trail_id, :user_id, :name, :latitude, :longitude, :difficulty, :distance, :description, :start_elevation, :avg_duration, :map_image, :thumbnail_image
end
