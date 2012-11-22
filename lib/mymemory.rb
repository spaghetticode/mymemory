require 'open-uri'
require 'mymemory/version'
require 'mymemory/translation'

module Mymemory
    class LanguageMissingError < Exception
    def message
      'please provide a target language value'
    end
  end

  # Mymemory.translate(text, :from => :en, :to => :it)
  def self.translate(text, opts)
    translation = Translation.new(text, opts)
    translation.translated_text
  end
end
