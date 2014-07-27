module SpellingCorrector
  class Levenshtein

    ALPHABET = 'abcdefghijklmnopqrstuvwxyz'
    EXIST = 1
    NOT_EXIST = 0

    class << self

      def levenshtein(feature)
        levenshtein = [feature]
        levenshtein += alteration(feature)
        levenshtein += insertion(feature)
        levenshtein += deletion(feature)
        levenshtein += transposition(feature)
        levenshtein.uniq
      end

      def insertion(feature)
        levenshtein = []
        (feature.size+1).times do |index|
          ALPHABET.each_char { |char| levenshtein << feature[0...index] + char + feature[index..feature.size] }
        end
        levenshtein
      end

      def deletion(feature)
        (0...feature.size).collect { |index| feature[0...index] + feature[(index+1)..feature.size] }
      end

      def alteration(feature)
        levenshtein = []
        feature.size.times do |index|
          ALPHABET.each_char { |char| levenshtein << feature[0...index] + char + feature[(index+1)..feature.size] }
        end
        levenshtein
      end

      def transposition(feature)
        (0...feature.size-1).collect { |index| feature[0...index] + feature[index+1] + feature[index] + feature[(index+2)..feature.size] }
      end

    end
  end
end
