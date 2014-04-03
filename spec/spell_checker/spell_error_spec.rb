# -*- encoding : utf-8 -*-
require 'spec_helper'

describe SpellChecker::SpellError do
  describe '#error_by_code' do
    it 'returns class by code' do
       described_class.class_by_code(1).should == SpellChecker::SpellError::UnknownWord
       described_class.class_by_code(2).should == SpellChecker::SpellError::RepeatedWord
       described_class.class_by_code(3).should == SpellChecker::SpellError::Capitalization
       described_class.class_by_code(4).should == SpellChecker::SpellError::TooManyErrors
    end

    context 'unknown code' do
      it 'raise error' do
        expect {
          described_class.class_by_code(5)
        }.to raise_error(SpellChecker::UnknownCodeError)
      end
    end
  end
end