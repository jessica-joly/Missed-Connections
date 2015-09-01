require 'spec_helper'

describe User do
  describe '#posts' do
    it { should have_many(:posts) }
  end

  describe '#keywords' do
    it { should have_many(:keywords).through(:posts) }
  end
end
