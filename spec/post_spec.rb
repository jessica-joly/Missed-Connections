require 'spec_helper'

describe Post do
  describe '#user' do
    it { should belong_to(:user) }
  end

  describe '#keyword' do
    it { should belong_to(:keyword) }
  end

  describe '#url' do

    it 'return the URL of a given post' do
      test_post = Post.create({:url => 'url', :keyword_id => nil, :user_id => nil})
      expect(test_post.url()).to(eq('url'))
    end
  end

end
