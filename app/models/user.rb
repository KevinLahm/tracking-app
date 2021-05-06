class User < ActiveRecord::Base
	has_secure_password
  validates :username, presence: true
  has_many :runs

  def slug
    self.username.downcase.split.join("-")
  end
  
  def self.find_by_slug(slug)
    self.all.find {|object| object.username if object.slug == slug}
  end
end
