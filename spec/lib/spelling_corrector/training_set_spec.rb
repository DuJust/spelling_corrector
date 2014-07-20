require 'spec_helper'
require 'spelling_corrector/training_set'

describe SpellingCorrector::TrainingSet do

  let(:training_set_path) { File.absolute_path('spec/lib/features/training_set.txt') }

  describe '#initialize' do
    subject { SpellingCorrector::TrainingSet.new(training_set_path) }
    its(:set) { should include('one') }
    its(:set) { should include('two') }
    its(:set) { should include('three') }
  end

end
