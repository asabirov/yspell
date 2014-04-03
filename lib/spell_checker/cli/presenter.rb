# coding: utf-8
require 'rainbow'

module SpellChecker
  module CLI
    class Presenter
      require 'rainbow/ext/string'

      def initialize(text, spell_errors, options)
        @text = text
        @errors = spell_errors
        @options = options
      end

      def draw(out)
        if @errors.empty?
          out.puts @text

          out.puts
          out.puts "It seems ok!".color(:green)
          return
        end

        highlight_errors(out)
        print_suggestions(out)
      end

      private

      def highlight_errors(out)
        row = 0
        @text.each_line do |line|
          row_errors = @errors.select{|err| err.row == row}.sort_by{|err| err.position}.reverse
          out.puts print_text_with_highlights(line, row_errors)
          row = row + 1
        end
      end

      def print_text_with_highlights(string, errors)
        errors.each do |error|
          replace_with = error.colored_word
          if @options[:inline_suggestions]
            replace_with << " (#{error.tip.join(', ')}?)".color(:yellow)
          end

          string[error.column...(error.column + error.length)] = replace_with
        end
        string
      end

      def print_suggestions(out)
        return if @options[:inline_suggestions]
        out.puts
        @errors.each do |error|
          out.puts "#{error.word} — #{error.tip.join(', ')}".color(:yellow)
        end
      end
    end
  end
end