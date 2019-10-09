class Article < ApplicationRecord
  belongs_to :blog
  belongs_to :user
  has_many :comments
end
