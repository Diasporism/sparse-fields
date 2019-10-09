class SerializableArticle < JSONAPI::Serializable::Resource
  type 'articles'

  attributes :title, :body, :created_at, :updated_at

  belongs_to :blog
  belongs_to :user

  has_many :comments do
    @object.comments.where(parent: nil)
  end
end
