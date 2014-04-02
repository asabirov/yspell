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

    require 'spell_checker'

    client = SpellChecker::Client.new
    client.check('some text for check', lang: 'en')


## Options

Use options when calling check method:

    client.check('some text for check', options)


| Key     | Description |
| ------- |-----------|
| lang    | ru, uk, or en  |
| options | http://api.yandex.ru/speller/doc/dg/reference/speller-options.xml |
| format  | plain or html  (default is plain) |

## Contributing

1. Fork it ( http://github.com/asabirov/spell_check/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
