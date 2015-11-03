require "spec_helper"

RSpec.describe "hotel_matcher", type: :aruba do
  describe "when no user input" do
    it "should display information message" do
      run "hotel_matcher"
      expect(all_stdout).to be == "Wrong usage of program hotel_matcher see --help\n"
    end
  end

  describe "#read user input" do
    context "when --help flag is given" do
      it "should display help message" do
        run "hotel_matcher --help"
        expect(all_stdout).to be == "Hotel matcher will search for a given hotel name and print its url\nUsage: hotel_matcher hotel-name e.g hotel_matcher \"DoubleTree Hilton Amsterdam\"\n"
      end
    end
  end
end
