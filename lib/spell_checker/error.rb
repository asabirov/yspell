require 'httpclient'
require 'multi_json'

module SpellChecker
  class Error < StandardError
  end

  class UnknownCodeError < Error; end
end