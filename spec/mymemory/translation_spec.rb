require 'spec_helper'

module Mymemory
  describe Translation do
    let(:subject) { Translation.new('hello world', :to => :it) }

    it 'source language defaults to english' do
      subject.from.should == :en
    end

    describe '#lang_pair' do
      it 'joins the source and target language code with a pipe' do
        subject.lang_pair.should == 'en|it'
      end
    end

    describe '#url' do
      it 'correctly encodes the url' do
        url = 'http://mymemory.translated.net/api/get?q=hello%20world&langpair=en%7Cit'
        subject.url.should == url
      end

      context 'when email address is present in configuration' do
        let(:email) { 'info@example.com' }

        before { Mymemory.config.email = email }
        after  { Mymemory.config.email = nil }

        it 'appends the email param to the url' do
          subject.url.should =~ /de=#{email}$/
        end
      end
    end

    context 'when the target language is missing' do
      it 'raises LanguageMissingError error' do
        expect do
          Translation.new('white rabbit', :from => :en)
        end.to raise_error(LanguageMissingError)
      end
    end

    describe '#parsed_response' do
      context 'request was successful' do
        let(:response) { double(:code => 200, :body => '{"some": {"cute": "json"}}') }

        it 'returns an hash from parsed json' do
          subject.stub(:response => response)
          subject.parsed_response.should == {'some' => {'cute' => 'json'}}
        end
      end

      context 'when request was not successful' do
        let(:response) { double(:code => 422, :body => 'whatever!') }

        it 'returns an empty hash' do
          subject.stub(:response => response)
          subject.parsed_response.should == {}
        end
      end
    end
  end
end
