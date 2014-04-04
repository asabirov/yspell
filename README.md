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
    client.check('sme text for chck')

    >> [
        #<YSpell::SpellError::UnknownWord:0x007f92a9156a38 @position=0, @row=0, @column=0, @length=3, @word="sme", @suggestions=["some", "me"], @code=1>,
        #<YSpell::SpellError::UnknownWord:0x007f92a9156808 @position=13, @row=0, @column=13, @length=4, @word="chck", @suggestions=["check", "chick", "chuck"], @code=1>
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
