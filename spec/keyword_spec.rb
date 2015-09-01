require 'spec_helper'

describe Keyword do
  describe '#posts' do
    it { should have_many(:posts) }
  end

  describe '#users' do
    it { should have_many(:users).through(:posts) }
  end
end
