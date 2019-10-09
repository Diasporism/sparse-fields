class Blog < ApplicationRecord
  has_many :articles
  has_many :comments, through: :articles

  def self.default_api_fields
    { blogs: [:name, :created_at] }
  end
end
