require 'spec_helper'
require 'spelling_corrector/application'

describe SpellingCorrector::Application do

  describe '#run' do
    let(:training_set_path) { '../features/training_set.txt' }

    subject { SpellingCorrector::Application.new(training_set_path).run(wrong_spelling) }

    context 'deletion' do
      let(:wrong_spelling) { 'acess' }
      it { should eq('access') }
    end

    context 'transposition' do
      let(:wrong_spelling) { 'acecss' }
      it { should eq('access') }
    end

    context 'alteration' do
      let(:wrong_spelling) { 'acqess' }
      it { should eq('access') }
    end

    context 'insertion' do
      let(:wrong_spelling) { 'acceess' }
      it { should eq('access') }
    end
  end
end