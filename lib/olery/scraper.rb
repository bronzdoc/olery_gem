module Olery
  # <Scraper> Will start scraping for data with the configured resources
  class Scraper
    attr_reader :word

    def initialize(word)
      @word = word
    end

    # Run the scraper
    def run
      Olery.configuration.resources.each do |resource|
        puts "Looking for hotels in #{resource.host} that match the word \"#{@word}\""
        resource.scrape @word
      end
    end
  end
end
