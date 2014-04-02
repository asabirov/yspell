# -*- encoding : utf-8 -*-
require 'spec_helper'

describe SpellChecker do
  let(:client) { SpellChecker::Client.new }

  let(:russian_text) do
    'Какой-то текст с ошбками'
  end

  context 'русский' do
    it '' do
      p client.check(russian_text)
    end
  end
end