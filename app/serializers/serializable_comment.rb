class SerializableComment < JSONAPI::Serializable::Resource
  type 'comments'

  attributes :note, :parent_id, :user_id, :replies, :created_at, :updated_at

  belongs_to :user
  belongs_to :article

  attribute :replies do
    @object.replies
  end
end
