require 'httpclient'
require 'multi_json'

module YSpell
  class Error < StandardError
  end

  class UnknownCodeError < Error; end
end