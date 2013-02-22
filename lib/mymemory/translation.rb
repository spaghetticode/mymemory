require 'json'
require 'httparty'

module Mymemory
  class Translation
    BASE_URL = 'http://mymemory.translated.net/api/get'

    attr_accessor :text, :from, :to, :response_json

    def initialize(text, opts)
      @text = text
      @from = opts.fetch(:from, :en)
      @to   = opts[:to] or raise LanguageMissingError.new
    end

    def url
      URI.escape("#{BASE_URL}?q=#{text}&langpair=#{lang_pair}#{email_key}")
    end

    def lang_pair
      [from, to].join('|')
    end

    def email_key
      config_email && "&de=#{config_email}"
    end

    def translated_text
      parsed_response['responseData']['translatedText']
    end

    def parsed_response
      response.code == 200 ? JSON.parse(response.body) : {}
    end

    private

    def response
      @response ||= HTTParty.get(url)
    end

    def config_email
      Mymemory.config.email
    end
  end
end
