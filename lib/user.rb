class User < ActiveRecord::Base
  has_many :posts
  has_many :keywords, through: :keywords_users
  has_many :keywords
  validates_uniqueness_of :email
  validates(:name, {:presence => true, :length => { :maximum => 20 }})
  validates(:email, {:presence => true})
  validates(:password, {:presence => true})
  before_save(:capitalize_name)

  private

  define_method(:capitalize_name) do
    self.name=(name().capitalize())
  end
end
