# coding: utf-8
require 'optparse'
require 'spell_checker/cli/presenter'

module SpellChecker
  module CLI
    class Application
      def initialize(out = STDOUT, err = STDERR)
        @client = Client.new
        @out = out
        @err = err
      end

      def run(argv)
        options = parse_options(argv)

        return unless argv[0]

        file = argv[0]

        unless File.exists? file
          error "File \"#{file}\" does not exists"
          return
        end

        text = File.read file
        Presenter.new(text, @client.check(text), options)
          .draw(@out)
      end

      private

      def parse_options(argv)
        options = {}
        opt_parser = OptionParser.new do |opt|
          opt.banner = 'Usage: spell_checker FILE [OPTIONS]'
          opt.separator  'Options'

          opt.on('-l LANG','--language ENVIRONMENT', String, 'text language') do |lang|
            options[:lang] = lang
          end

          opt.on('-f FORMAT','--format FORMAT', String, 'file format (html or plain)') do |format|
            options[:format] = format
          end

          opt.on('-m MODE', '--mode MODE', String, 'Delay N seconds before executing') do |mode|
            options[:mode] = mode
          end

          opt.on('-i','--inline-suggestions', String, 'text language') do
            options[:inline_suggestions] = true
          end

          opt.on('-v', '--verbose', 'Run verbosely') do |v|
            options[:verbose] = v
          end

          opt.on_tail('-h','--help','help') do
            @out.puts opt_parser
            return
          end

          options
        end

        opt_parser.parse! (argv)

        unless argv[0]
          @out.puts opt_parser
        end

        options
      end

      def puts(text)
        @out.puts text
      end

      def error(text)
        @err.puts text
      end
    end
  end
end