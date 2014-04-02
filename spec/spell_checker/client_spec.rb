# -*- encoding : utf-8 -*-
require 'spec_helper'

describe SpellChecker::Client do
  include WebHelpers

  let(:client) { described_class.new }
  let(:russian_text) do
    'Какой-то текст с ошбками'
  end

  context '' do

  end

  context 'русский' do
    before do
      stub_response(russian_text, '[{"code":1, "pos":17, "row":0, "col":17, "len":7, "word":"ошбками", "s":["ошибками"]}]')
    end

    let(:result) { client.check(russian_text)}

    it 'returns Container' do
      client.check(russian_text).should be_a(SpellChecker::Container)
    end

    specify { result.code.should == 1 }
    specify { result.error.should be_a(SpellChecker::SpellError::UnknownWord) }
    specify { result.pos.should == 17 }
    specify { result.row.should == 0 }
    specify { result.col.should == 17 }
    specify { result.len.should == 7 }
    specify { result.s.should == ['ошибками'] }
  end
end