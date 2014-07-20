require 'spelling_corrector/training_set'
require 'spelling_corrector/trainer'

module SpellingCorrector
  class Application

    def initialize(training_set_path)
      @trainer = Trainer.new(TrainingSet.new(training_set_path))
    end

    def run(data)
      @trainer.correct(data)
    end
  end
end