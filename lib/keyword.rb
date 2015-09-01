class Keyword < ActiveRecord::Base
  has_many :posts
  has_many :users, through: :keywords_users

  # has_and_belongs_to_many :users

end
