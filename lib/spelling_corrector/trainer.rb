require 'spelling_corrector/training_set'
require 'spelling_corrector/levenshtein'

module SpellingCorrector
  class Trainer

    def initialize(training_set)
      @training_set = training_set
      @features = create_features
      @levenshtein_set = create_levenshtein_set
    end

    def correct(data)
      correct = @training_set.set.max_by { |feature| conditional_probability(data, feature) * probability(feature) }
      return data if conditional_probability(data, correct) == Levenshtein::NOT_EXIST
      correct
    end

    def probability(feature)
      @features[feature]
    end

    def conditional_probability(data, feature)
      @levenshtein_set[feature].include?(data) ? Levenshtein::EXIST : Levenshtein::NOT_EXIST
    end

    private

    def create_features
      @training_set.set.reduce({}) do |meta, feature|
        meta[feature] ||= 0
        meta[feature] += 1
        meta
      end
    end

    def create_levenshtein_set
      @training_set.set.reduce({}) do |meta, feature|
        meta[feature] ||= Levenshtein.levenshtein(feature)
        meta
      end
    end
  end
end
