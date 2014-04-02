require 'httpclient'
require 'multi_json'

module SpellChecker
  class Container

    attr_reader :error, :code, :pos, :row, :col, :len, :word, :s

    def initialize(response)
      response.each do |name, value|
        instance_variable_set("@#{name}",value)
      end

      @error = SpellError.error_from_code(code)
    end

  end
end