module SpellingCorrector
  class Levenshtein

    ALPHABET = 'abcdefghijklmnopqrstuvwxyz'

    class << self

      def levenshtein(feature)
        levenshtein = []
        feature.size.times do |index|
          levenshtein += insertion(feature, index)
          levenshtein += deletion(feature, index)
          levenshtein += alteration(feature, index)
        end
        levenshtein += transposition(feature)
        levenshtein
      end

      def insertion(feature, index)
        levenshtein = []
        ALPHABET.each_char { |char| levenshtein << feature[0...index] + char + feature[index..feature.size] }
        levenshtein
      end

      def deletion(feature, index)
        levenshtein = []
        levenshtein << feature[0...index] + feature[(index+1)..feature.size]
        levenshtein
      end

      def alteration(feature, index)
        levenshtein = []
        ALPHABET.each_char { |char| levenshtein << feature[0...index] + char + feature[(index+1)..feature.size] }
        levenshtein
      end

      def transposition(feature)
        levenshtein = []
        (feature.size-1).times { |index| levenshtein << feature[0...index] + feature[index+1] + feature[index] + feature[(index+2)..feature.size] }
        levenshtein
      end

    end
  end
end
