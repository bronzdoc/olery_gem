module Olery
  module Helpers
    module Matcher
      # Get the best match of a pattern in a array of strings
      # @return <String>, a string in a set of strings that matched the most
      # in a patern, if multiple strings with the same matching counter are found
      # it will return the irst best match.
      #
      # @param [Array<String>] strings_to_search
      # @param [String] patterns
      def self.best_match(strings_to_search, patterns)
        strings_to_search.map! &:downcase
        patterns = patterns.downcase.split " "
        max_matcher = 0
        best_match = nil

        # Go through all the strings
        strings_to_search.each do |str|
          match_counter = 0
          words_found = []

          # Check if the pattern match in any place of the word
          patterns.each do |pattern|
            if str =~ /#{pattern}/ && !words_found.include?(pattern)
              match_counter += 1
              words_found << pattern
            end
          end

          # Update best match only if we find a string that has more matches than the previous best match
          if match_counter > max_matcher
            max_matcher = match_counter
            best_match = str
          end
        end

        best_match
      end
    end
  end
end
