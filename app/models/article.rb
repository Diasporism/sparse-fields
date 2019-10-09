class Article < ApplicationRecord
  belongs_to :blog
  belongs_to :user
  has_many :comments

  def self.default_api_fields
    { articles: [:title, :body, :created_at] }
  end

  def self.default_api_include
    []
  end
end
