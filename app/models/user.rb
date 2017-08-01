class User < ActiveRecord::Base
  include Sluggable

  has_many :posts
  has_many :comments
  has_many :votes

  has_secure_password validations: false  
  before_save :generate_slug!

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 5}
  # 只在create的時候驗證是怎樣？ 當update的時候這個欄位可以是空白的

  sluggable_column :username

  def admin?
    self.role == 'admin'
  end

  def moderator?
    self.role == 'moderator'
  end
end