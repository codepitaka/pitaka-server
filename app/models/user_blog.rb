# frozen_string_literal: true

# UserBlog
class UserBlog < ApplicationRecord
  enum status: { owner: 0, member: 1 }
  belongs_to :user
  belongs_to :blog
  validates :user_id, :blog_id, :status, presence: true
end
