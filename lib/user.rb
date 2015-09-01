class User < ActiveRecord::Base
  has_many :posts
  has_many :keywords, through: :keywords_users
  has_many :keywords

end
