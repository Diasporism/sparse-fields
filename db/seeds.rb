lowly_author      = User.create!(email: 'i_am_under_paid@example.com')
average_reader    = User.create!(email: 'i_am_very_normal@example.com')
well_actually_guy = User.create!(email: 'you_are_very_wrong@example.com')

blog = Blog.create!(name: 'Boulder Ruby Blog')

UserPermission.create!(user: lowly_author, blog: blog)

5.times do
  article = blog.articles.create!(title: "On Apathy and Other Small Victories", body: "Imagine a world where this had a bunch of Lorem Ipsum text", user: lowly_author)

  3.times do
    comment = article.comments.create!(user: average_reader, note: "I really enjoy your articles")
    reply   = article.comments.create!(user: well_actually_guy, note: "Only plebs read this trash", parent: comment)
  end
end
