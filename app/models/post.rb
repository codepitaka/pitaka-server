# frozen_string_literal: true

# Post
class Post < ApplicationRecord
  belongs_to :blog
  has_many :snippets
  validates :title, :subtitle, :content, :blog_id, presence: true
end
