json.article do
  json.id @article.id
  json.title @article.title
  json.body @article.body

  json.author do
    json.email @article.user.email
  end

  json.comments @comments do |comment|
    json.id comment.id
    json.note comment.note

    json.user do
      json.email comment.user.email
    end

    json.replies comment.replies do |reply|
      json.id comment.id
      json.note comment.note

      json.user do
        json.email comment.user.email
      end
    end
  end
end
