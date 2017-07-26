class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  has_secure_password validations: false

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create
  # 只在create的時候驗證是怎樣？
end