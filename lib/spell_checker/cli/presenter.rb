# coding: utf-8
require 'rainbow'

module SpellChecker
  module CLI
    class Presenter
      require 'rainbow/ext/string'

      def initialize(out, err)
        @out = out
        @err = err
        @verbose = false
      end

      def draw(text, spell_errors, options)
        @verbose = options.verbose

        if spell_errors.empty?
          @out.puts text
          @out.puts
          @out.puts "It seems ok!".color(:green)
          return
        end

        highlight_errors(text, spell_errors, options)

        if options.suggestions == :after
          print_suggestions(spell_errors)
        end
      end

      def puts(text)
        @out.puts text
      end

      def error(text)
        @err.puts text.color(:red)
      end

      def info(msg)
        @out.puts(msg) if @verbose
      end

      private

      def highlight_errors(text, errors, options)
        row = 0
        text.each_line do |line|
          row_errors = errors.select{|err| err.row == row}.sort_by{|err| err.position}.reverse
          @out.puts print_text_with_highlights(line, row_errors, options)
          row = row + 1
        end
      end

      def print_text_with_highlights(string, errors, options)
        errors.each do |error|
          replace_with = error.colored_word
          if options.suggestions == :inline
            replace_with << " (#{error.suggestions.join(', ')}?)".color(:yellow)
          end

          string[error.column...(error.column + error.length)] = replace_with
        end
        string
      end

      def print_suggestions(errors)
        @out.puts
        errors.each do |error|
          @out.puts "#{error.word} — #{error.suggestions.join(', ')}".color(:yellow)
        end
      end
    end
  end
end