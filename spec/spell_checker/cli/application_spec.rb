# coding: utf-8
require 'spec_helper'
require 'spell_checker/cli/application'

describe SpellChecker::CLI::Application do
  include WebHelpers
  let(:stdout) { StringIO.new }
  let(:cli) { described_class.new(stdout) }

  context 'without file and options' do
    let(:argv) { [] }

    it 'returns instructions' do
      cli.run(argv)
      stdout.rewind
      stdout.read.should include('Usage: spell-check TEXT [OPTIONS]')
    end
  end

  context 'check file' do
    let(:argv) { ['--file=spec/fixtures/russian.txt'] }

    before do
      stub_api_response('[
        {"code":1,"pos":0,"row":0,"col":0,"len":4,"word":"\u041a\u043e\u0433\u0430","s":["\u041a\u043e\u0433\u0434\u0430","\u041a\u043e\u043a\u0430","\u041a\u043e\u0433\u043e","\u0413\u043e\u0433\u0430"]},
        {"code":1,"pos":8,"row":0,"col":8,"len":12,"word":"\u043c\u0435\u0447\u0442\u0430\u0442\u0435\u043b\u044c\u043d\u043c\u0443","s":["\u043c\u0435\u0447\u0442\u0430\u0442\u0435\u043b\u044c\u043d\u043e\u043c\u0443"]}
      ]')
    end

    it 'shows errors in text' do
      cli.run(argv)
      stdout.rewind

      stdout.read.should
        include("#{'Кога'.color(:red)} #{'(Когда, Кока, Кого, Гога?)'.color(:yellow)}, к #{'мечтательнму'.color(:red)} #{'(мечтательному?)'.color(:yellow)} миру")
    end
  end
end