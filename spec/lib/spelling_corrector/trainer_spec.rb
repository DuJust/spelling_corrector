require 'spec_helper'
require 'spelling_corrector/trainer'

module SpellingCorrector
  describe Trainer do

    let(:training_set) { TrainingSet.new(File.absolute_path('spec/lib/features/training_set.txt')) }
    let(:trainer) { Trainer.new(training_set) }

    describe '#probability' do
      subject { trainer.probability('access') }
      it { should eq(2) }
    end

    describe '#conditional_probability' do

      subject { trainer.conditional_probability(wrong_spelling, 'access') }

      context 'insertion' do
        let(:wrong_spelling) { 'acceess' }
        it { should eq(1) }
      end

      context 'deletion' do
        let(:wrong_spelling) { 'acess' }
        it { should eq(1) }
      end

      context 'alteration' do
        let(:wrong_spelling) { 'acqess' }
        it { should eq(1) }
      end

      context 'transposition' do
        let(:wrong_spelling) { 'acecss' }
        it { should eq(1) }
      end

      context 'not included' do
        let(:wrong_spelling) { 'not included' }
        it { should eq(0) }
      end
    end

    describe '#correct' do
      subject { trainer.correct(wrong_spelling) }

      context 'training set include' do
        let(:wrong_spelling) { 'acces' }
        it { should eq('access') }
      end

      context 'training set does not include' do
        let(:wrong_spelling) { 'NotInclude' }
        it { should eq('NotInclude') }
      end
    end

  end
end
