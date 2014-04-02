# -*- encoding : utf-8 -*-
require 'spec_helper'

describe SpellChecker::SpellError do
  describe '#error_by_code' do
    it 'returns class by code' do
       described_class.error_from_code(1).should be_a(SpellChecker::SpellError::UnknownWord)
       described_class.error_from_code(2).should be_a(SpellChecker::SpellError::RepeatedWord)
       described_class.error_from_code(3).should be_a(SpellChecker::SpellError::Capitalization)
       described_class.error_from_code(4).should be_a(SpellChecker::SpellError::TooManyErrors)
    end

    context 'unknown code' do
      it 'raise error' do
        expect {
          described_class.error_from_code(5)
        }.to raise_error(SpellChecker::UnknownCodeError)
      end
    end
  end

  describe '#to_s' do
    it 'returns class name without namespace' do
      SpellChecker::SpellError::UnknownWord.new.to_s.should == 'UnknownWord'
    end
  end
end