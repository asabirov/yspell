WIP

# SpellChecker

Simple client for api.yandex.ru/speller


## Installation

Add this line to your application's Gemfile:

    gem 'spell_check', 'git' => 'github.com:asabirov/spell_checker.git'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spell_check

## Usage

As ruby library

    require 'spell_checker'

    client = SpellChecker::Client.new
    client.check('some text for check')


As command line tool

    Usage: spell-check TEXT [OPTIONS]
    Options
            --file FILE                  path to file
        -l, --language LANG              separated list of languages
                                         Available: ru, en or uk (default is "ru, en")
        -f, --format FORMAT              file format (html or plain)
        -m, --mode MODE                  Yandex Spell mode
                                         for more information, see http://api.yandex.ru/speller/doc/dg/reference/speller-options.xml
        -s, --suggestions POSITION       show suggestions after errors
                                         inline, after_text, none
        -v, --verbose                    Run verbosely
        -h, --help                       help



## Options

Use options when calling check method:

    client.check('some text for check', options)


| Key     | Description |
| ------- |-------------|
| lang    | List of languages. Supported ru, en, uk (default is "ru,en")|
| options | Value from 0 to 5, for more information, see http://api.yandex.ru/speller/doc/dg/reference/speller-options.xml  |
| format  | Format of text. Supported plain and html (default is plain) |

## Contributing

1. Fork it ( http://github.com/asabirov/spell_checker/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
