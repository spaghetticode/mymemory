require 'spec_helper'

describe Mymemory do
  context 'when making external API calls', :vcr do
    it 'returns expected translation' do
      text = "Wasn't born to Follow"
      result = Mymemory.translate(text, :from => :en, :to => :it)
      result.should == 'Non era nato per seguire'
    end
  end
end
