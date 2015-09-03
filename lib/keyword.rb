class Keyword < ActiveRecord::Base
  has_many :posts
  has_many :users, through: :keywords_users
end
