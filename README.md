WIP

# YSpell

Spell checker library and command-line tool. It uses Yandex Speller API (http://api.yandex.ru/speller/doc/dg/concepts/speller-overview.xml).


## Installation

Add this line to your application's Gemfile:

    gem 'yspell'

If you want use the latest code from github

    gem 'yspell', 'git' => 'github.com:asabirov/yspell.git'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yspell

## Usage

As command line tool

    Usage: yspell TEXT [OPTIONS]
    Options
        -F, --file FILE                  path to file
        -l, --language LANG              Comma-separated list of languages
                                         Available languages: ru, en or uk (default is "ru, en")
        -f, --format FORMAT              File format (html or plain)
        -m, --mode MODE                  Yandex Spell mode
                                         for more information, see http://api.yandex.ru/speller/doc/dg/reference/speller-options.xml
        -s, --suggestions POSITION       Show suggestions after errors
                                         inline, after_text, none
        -v, --verbose                    Run verbosely
        -h, --help                       Help

As ruby library

    require 'yspell'

    client = YSpell::Client.new
    client.check('some text for check')

    >> [
        #<YSpell::SpellError::UnknownWord:0x007ff9ba4cac00 @position=33, @row=0, @column=33, @length=6, @word="hapens", @suggestions=["happens"], @code=1>,
        #<YSpell::SpellError::UnknownWord:0x007ff9ba4caa48 @position=46, @row=1, @column=4, @length=9, @word="samething", @suggestions=["something"], @code=1>,
        #<YSpell::SpellError::UnknownWord:0x007ff9ba4ca868 @position=142, @row=2, @column=51, @length=9, @word="hon-estly", @suggestions=["honestly"], @code=1>
    ]



## Options

Use options when calling check method:

    client.check('some text for check', options)


| Key     | Description |
| ------- |-------------|
| lang    | List of languages. Supported ru, en, uk (default is "ru,en")|
| options | Value from 0 to 5, for more information, see http://api.yandex.ru/speller/doc/dg/reference/speller-options.xml  |
| format  | Format of text. Supported plain and html (default is plain) |

## Contributing

1. Fork it ( http://github.com/asabirov/yspell/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
