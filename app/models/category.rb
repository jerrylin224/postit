class Category < ActiveRecord::Base
  include Sluggable

  has_many :posts, through: :post_categories
  has_many :post_categories

  validates :name, presence: true

  def already_exist?
    situation = false

    Category.all.each do |c|
      situation = true if c.name == self.name
    end

    situation
  end

  sluggable_column :name
end

