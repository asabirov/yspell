# coding: utf-8
require 'optparse'
require 'spell_checker/cli/presenter'
require 'ostruct'

module SpellChecker
  module CLI
    class Application
      def initialize(out = STDOUT, err = STDERR)
        @client = Client.new
        @out = out
        @err = err
        @verbose = false
      end

      def run(argv)
        options = parse_options(argv)

        return if !options.file && !argv[0]

        text = find_text(argv, options)

        if text.empty?
          presenter.error "Text is empty"
          return
        end

        presenter.info "Options: #{options}"

        errors = @client.check(text,
          :lang => options.language,
          :format => options.format,
          :options => options.mode
        )

        presenter.draw(text, errors, options)
      end

      private

      def presenter
        @presenter ||= Presenter.new(@out, @err)
      end

      def parse_options(argv)
        options = {}
        opt_parser = OptionParser.new do |opt|
          opt.banner = 'Usage: spell-check TEXT [OPTIONS]'
          opt.separator  'Options'
          options = OpenStruct.new
          options.suggestions = :inline

          opt.on('-f FILE','--file FILE', String, 'path to file') do |file|
            options.file = file
          end

          opt.on('-l LANG','--language LANG', [:ru, :uk, :en], 'separated list of languages', 'Available: ru, en or uk (default is "ru, en")') do |language|
            options.language = language
          end

          opt.on('-f FORMAT','--format FORMAT', String, 'file format (html or plain)') do |format|
            options.format = format
          end

          opt.on('-m MODE', '--mode MODE', String, 'Yandex Spell mode', 'for more information, see http://api.yandex.ru/speller/doc/dg/reference/speller-options.xml') do |mode|
            options.mode = mode
          end

          opt.on('-s','--suggestions POSITION', [:inline, :after, :none], 'show suggestions after errors', 'inline, after_text, none') do |mode|
            options.suggestions = true
          end

          opt.on('-v', '--verbose', 'Run verbosely') do |v|
            @verbose = true
            options.verbose = v
          end

          opt.on_tail('-h','--help','help') do
            presenter.puts opt_parser
            return
          end

          options
        end

        opt_parser.parse!(argv)

        if !options.file && !argv[0]
          presenter.puts opt_parser
        end

        options
      end

      def find_text(argv, options)
        if options.file
          if File.exists?(options.file)
            File.read(options.file)
          else
            presenter.error "File \"#{file}\" does not exists"
          end
        else
          argv[0]
        end
      end
    end
  end
end