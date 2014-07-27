module SpellingCorrector
  class TrainingSet

    attr_reader :set

    def initialize(training_set_path)
      @set = File.open(training_set_path, 'r') { |file| file.read.split("\n") }
    end

  end
end
