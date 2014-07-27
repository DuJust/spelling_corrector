require 'spec_helper'
require 'spelling_corrector/levenshtein'

module SpellingCorrector
  describe Levenshtein do

    describe '#levenshtein' do
      subject { Levenshtein.levenshtein('access') }

      context 'origin feature' do
        it { should include('access') }
      end

      context 'insertion' do
        context 'header' do
          it { should include('aaccess') }
        end

        context 'body' do
          it { should include('acceess') }
        end

        context 'tail' do
          it { should include('accessa') }
        end
      end

      context 'deletion' do
        it { should include('acess') }
      end

      context 'alteration' do
        it { should include('acqess') }
      end

      context 'transposition' do
        it { should include('acecss') }
      end

      context 'not included' do
        it { should_not include('not included') }
      end
    end
  end
end
