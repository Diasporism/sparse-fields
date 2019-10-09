object @blog
attributes :id, :name
child :articles do |blog|
  attribute :id
  attribute :title
  attribute :body
end
