module Olery

  # <Inspector> will inspect the data we get back from the resource/s
  class Inspector
    attr_reader :word, :results_queue

    def initialize(word)
      @word = word
      @results_queue = Queue.new
    end

    # Inspect configuration resoruces
    def inspect
      Olery.configuration.resources.each do |resource|
        puts "Looking for hotels in #{resource.host} that match the word \"#{@word}\""
        run resource
      end
    end

    private
    def run(resource)
      resource.scrape @word
    end
  end
end
