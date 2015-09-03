require 'spec_helper'

describe Keyword do
  describe '#posts' do
    it { should have_many(:posts) }
  end

  describe 'not #users' do
    it('has associated users') do
      user = User.create({:name => 'Ace'})
      keyword = Keyword.create({:keyword => "cheese"})
      association = Keywords_Users.create({:user_id => user.id(), :keyword_id => keyword.id()})
      expect(association.keyword_id()).to(eq(keyword.id()))
    end
  end
end
