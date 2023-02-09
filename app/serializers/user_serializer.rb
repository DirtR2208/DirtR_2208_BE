class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :trails
end
