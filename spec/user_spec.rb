require 'spec_helper'

describe User do
  describe '#posts' do
    it { should have_many(:posts) }
  end

  describe '#keywords' do
    it { should have_many(:keywords).through(:posts) }
  end

  describe 'validation' do
    it 'validates uniqueness of user email' do
      test_user1 = User.create({:name => "Austin", :email => "austin@gmail.com", :password => "cheese"})
      test_user2 = User.new({:name => "Fred", :email => "austin@gmail.com", :password => "nugget"})
      expect(test_user2.save()).to(eq(false))
    end
  end
end
