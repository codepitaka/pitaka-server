# frozen_string_literal: true

# Blog
class Blog < ApplicationRecord
  has_many :posts
  has_many :user_blogs, dependent: :destroy
  has_many :users, through: :user_blogs
  validates :title, presence: true
end
