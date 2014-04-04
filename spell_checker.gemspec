# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spell_checker/version'

Gem::Specification.new do |spec|
  spec.name          = "spellchecker"
  spec.version       = SpellChecker::VERSION
  spec.authors       = ["a.sabirov"]
  spec.email         = ["sladecj@gmail.com"]
  spec.summary       = "Command line spell checker"
  spec.description   = "It uses yandex speller api and supported languages ru, en and uk"
  spec.homepage      = "http://artursabirov.ru"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'httpclient'
  spec.add_dependency 'multi_json'
  spec.add_dependency 'rainbow', '>= 2.0.0'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'webmock', '>= 1.11.0'
end
