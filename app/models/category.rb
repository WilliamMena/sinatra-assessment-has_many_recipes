class Category < ActiveRecord::Base
  has_many :recipes
  has_many :users, through: :recipes

  def slug
    self.name.sub(" ","-")
  end

  def self.find_by_slug(slug)
    category = ""
    Category.all.each do |u|
      if slug == u.slug
        category = u
      end
    end
    category
  end
end