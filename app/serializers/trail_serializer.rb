class TrailSerializer
  include JSONAPI::Serializer
  
  attributes :id, :name, :latitude,:longitude,:difficulty,:distance,:description,:created_at,:updated_at,:start_elevation,:avg_duration,:map_image,:thumbnail_image,:county_id
end
