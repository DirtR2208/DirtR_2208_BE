class CountySerializer
  include JSONAPI::Serializer
  attributes :name, :trails
end
