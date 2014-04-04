require 'httpclient'
require 'multi_json'

module SpellChecker
  class SpellError
    class UnknownWord < SpellError
      COLOR = :red
    end
    class RepeatedWord < SpellError
      COLOR = :yellow
    end
    class Capitalization < SpellError
      COLOR = :yellow
    end
    class TooManyErrors < SpellError
      COLOR = :red
    end

    #COLOR = :red

    attr_reader :code, :position, :row, :column, :length, :word, :suggestions

    CODE_TO_ERROR = [UnknownWord, RepeatedWord, Capitalization, TooManyErrors]

    def self.from_result(result)
      class_by_code(result['code']).new(result)
    end

    def self.class_by_code(code)
      key = code - 1

      raise(UnknownCodeError, "Code #{code} is unknown") if CODE_TO_ERROR[key].nil?
      CODE_TO_ERROR[key]
    end

    def initialize(result)
      @position = result['pos']
      @row = result['row']
      @column = result['col']
      @length = result['len']
      @word = result['word']
      @suggestions = result['s']
      @code = result['code']
    end

    def colored_word
      word.color(self.class::COLOR)
    end
  end
end