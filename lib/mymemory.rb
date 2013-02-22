require 'open-uri'
require 'mymemory/version'
require 'mymemory/translation'
require 'active_support/configurable'

module Mymemory
    include ActiveSupport::Configurable

    config_accessor :email

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
