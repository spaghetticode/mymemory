require 'spec_helper'

module Mymemory
  describe Translation do
    let(:subject) { Translation.new('hello', :to => :it) }

    it 'source language defaults to english' do
      subject.from.should == :en
    end

    describe '#lang_pair' do
      it 'joins the source and target language code with a pipe' do
        subject.lang_pair.should == 'en|it'
      end
    end

    describe '#escaped_text' do
      it 'escapes not allowed characters' do
        subject.text = 'some text'
        subject.escaped_text.should == 'some%20text'
      end
    end

    describe '#url' do
      it 'builds expected url' do
        url = 'http://mymemory.translated.net/api/get?q=hello&langpair=en|it'
        subject.url.should == url
      end
    end

    context 'when the target language is missing' do
      it 'raises LanguageMissingError error' do
        expect do
          Translation.new('white rabbit', :from => :en)
        end.to raise_error(LanguageMissingError)
      end
    end
  end
end
