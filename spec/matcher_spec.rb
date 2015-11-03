require "spec_helper"
require "olery/helpers/matcher"

RSpec.describe Olery::Helpers::Matcher do
  describe "#best_match" do
    context "when an array of strings and a pattern to search are given" do
      it "should return the best match of the pattern" do
        array_of_strings = [
          "Park Plaza Vondelpark, Amsterdam",
          "Crowne Plaza Amsterdam City Centre",
          "WestCord Fashion Hotel Amsterdam",
          "Radisson Blu Hotel, Amsterdam",
          "DoubleTree by Hilton Hotel Amsterdam Centraal Station",
          "Hilton Amsterdam",
          "Grand Hotel Amrath Amsterdam",
          "Crowne Plaza Amsterdam South",
          "Hampshire Hotel - Amsterdam American"
        ]

        pattern = "amsterdam doubletree hilton"

        best_match = Olery::Helpers::Matcher.best_match(array_of_strings, pattern)
        expect(best_match).to be == "doubletree by hilton hotel amsterdam centraal station"
      end
    end
  end
end

