# frozen_string_literal: true

# User
class User < ApplicationRecord
  has_secure_password
  # 'dependent: :destroy' means when a user is deleted, the related user_blogs will be deleted
  has_many :user_blogs, dependent: :destroy
  has_many :blogs, through: :user_blogs
  validates :name, :email, :password_digest, presence: true
end
