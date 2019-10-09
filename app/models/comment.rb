class Comment < ApplicationRecord
  before_save :ensure_single_thread, if: :parent

  belongs_to :user
  belongs_to :parent, optional: true, class_name: 'Comment'

  def replies
    Comment.where(parent_id: self.id)
  end

  private

  def ensure_single_thread
    self.parent = parent.parent while parent.parent
  end
end
