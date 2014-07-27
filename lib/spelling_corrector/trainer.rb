require 'spelling_corrector/training_set'
require 'spelling_corrector/levenshtein'

module SpellingCorrector
  class Trainer

    def initialize(training_set)
      @training_set = training_set
    end

    def correct(data)
      @training_set.set.max_by { |origin| conditional_probability(data, origin) * probability(origin) }
    end

    def probability(feature)
      @features ||= create_features
      @features[feature]
    end

    def conditional_probability(data, origin)
      Levenshtein.levenshtein(origin).include?(data) ? 1 : 0
    end

    private

    def create_features
      @training_set.set.reduce({}) do |meta, feature|
        meta[feature] ||= 0
        meta[feature] += 1
        meta
      end
    end
  end
end
