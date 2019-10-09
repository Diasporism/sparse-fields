object @article
attributes :id, :title, :body
child user: :author do
  attribute :email
end
child @comments, object_root: false do
  attribute :id
  attribute :note
  child :user do
    attribute :email
  end
  child replies: :replies do
    attribute :id
    attribute :note
    child :user do
      attribute :email
    end
  end
end
