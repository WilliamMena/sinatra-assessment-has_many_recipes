class Recipe < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  def slug
    self.name.sub(" ","-")
  end

  def self.find_by_slug(slug)
    recipe = ""
    Recipe.all.each do |u|
      if slug == u.slug
        recipe = u
      end
    end
    recipe
  end


end