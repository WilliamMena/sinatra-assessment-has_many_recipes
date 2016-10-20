class User < ActiveRecord::Base
  
  has_secure_password

  has_many :followers_association, :class_name => "Follower"
  has_many :followers, :through => :followers_association, :source => :follower
  has_many :following_association, :class_name => "Follower", :foreign_key => "follower_id"
  has_many :following, :through => :following_association, :source => :user

  has_many :recipes
  has_many :categories, through: :recipes

  validates :username, uniqueness:true
  validates :username, presence: true

  validates :email, uniqueness:true
  validates :email, presence: true



  def slug
    self.username.sub(" ","-")
  end

  def self.find_by_slug(slug)
    user = ""
    User.all.each do |u|
      if slug == u.slug
        user = u
      end
    end
    user
  end

end