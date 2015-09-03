require 'spec_helper'

describe User do
  describe '#posts' do
    it { should have_many(:posts) }
  end

  describe 'not #keywords' do
    it('has associated keywords') do
      user = User.create({:name => 'Ace'})
      keyword = Keyword.create({:keyword => "cheese"})
      association = Keywords_Users.create({:user_id => user.id(), :keyword_id => keyword.id()})
      expect(association.user_id()).to(eq(user.id()))
    end
  end

  describe 'validation' do
    it 'validates uniqueness of user email' do
      test_user1 = User.create({:name => "Austin", :email => "austin@gmail.com", :password => "cheese"})
      test_user2 = User.new({:name => "Fred", :email => "austin@gmail.com", :password => "nugget"})
      expect(test_user2.save()).to(eq(false))
    end
  end

  describe '#capitalize' do
    it 'capitalizes the user name' do
      test_user = User.create({:name => "austin", :email => "austin@gmail.com", :password => "cheese"})
      expect(test_user.name()).to(eq('Austin'))
    end
  end
end
