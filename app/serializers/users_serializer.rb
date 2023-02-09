class UsersSerializer
  include JSONAPI::Serializer
  attributes :name, :email
end
