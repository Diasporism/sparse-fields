class SerializableBlog < JSONAPI::Serializable::Resource
  type 'blogs'

  attributes :name, :created_at, :updated_at

  has_many :articles
end
