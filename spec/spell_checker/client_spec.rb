# -*- encoding : utf-8 -*-
require 'spec_helper'

describe YSpell::Client do
  include WebHelpers

  let(:client) { described_class.new }
  let(:result) { client.check(text).first }

  before do
    WebMock.disable!
  end


  context 'russian' do
    let(:text) { File.read('spec/fixtures/russian.txt') }

    it 'returns Container' do
      client.check(text).first.should be_a(YSpell::SpellError::UnknownWord)
    end

    it 'returns correct errors' do
      result.code.should == 1
      result.position.should == 0
      result.row.should == 0
      result.column.should == 0
      result.length.should == 4
      result.word.should == 'Кога'
      result.suggestions.should == ['Когда', 'Кока', 'Кого', 'Гога']
    end
  end

  context 'english' do
    let(:text) { File.read('spec/fixtures/english.txt') }

    it 'returns Container' do
      client.check(text).first.should be_a(YSpell::SpellError::UnknownWord)
    end

    it 'returns correct errors' do
      result.code.should == 1
      result.position.should == 33
      result.row.should == 0
      result.column.should == 33
      result.length.should == 6
      result.word.should == 'hapens'
      result.suggestions.should == ['happens']
    end
  end
end