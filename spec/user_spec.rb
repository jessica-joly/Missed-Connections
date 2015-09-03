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
end
