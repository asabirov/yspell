require 'httpclient'
require 'multi_json'

module SpellChecker
  class SpellError
    class UnknownWord < SpellError; end
    class RepeatedWord < SpellError; end
    class Capitalization < SpellError; end
    class TooManyErrors < SpellError; end

    CODE_TO_ERROR = [UnknownWord, RepeatedWord, Capitalization, TooManyErrors]

    def self.error_from_code(code)
      key = code - 1

      raise(UnknownCodeError, "Code #{code} is unknown") if CODE_TO_ERROR[key].nil?

      CODE_TO_ERROR[key].new
    end

    def to_s
      self.class.name.gsub /.*::([^:]+?)$/, '\\1'
    end
  end
end