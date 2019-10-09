class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.references :user
      t.references :blog
      t.timestamps
    end
  end
end
