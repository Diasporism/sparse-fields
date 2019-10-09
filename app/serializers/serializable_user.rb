class SerializableUser < JSONAPI::Serializable::Resource
  type 'users'

  attributes :email

  has_many :comments
  has_many :articles
end
