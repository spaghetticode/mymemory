require 'spec_helper'

describe Mymemory do
  it 'returns expected translation' do
    text = 'hello world'
    result = Mymemory.translate(text, :from => :en, :to => :it)
    result.should == 'ciao mondo'
  end
end
