module Olery
  module Helpers
    module String
      # Removes new lines and trailing space from a string
      # @return <String>, a new string without new lines or trailing space
      # @param [String] word
      def self.trim(word)
        word.gsub("\n", " ").strip
      end
    end
  end
end

