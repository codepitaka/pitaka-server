class User < ApplicationRecord
    has_secure_password
    has_many :user_blogs, dependent: :destroy
    has_many :blogs, through: :user_blogs
    validates :name, :email, :password_digest, presence: true
end
