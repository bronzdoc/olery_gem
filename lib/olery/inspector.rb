module Olery

  # <Inspector> will inspect the data we get back from the resource/s
  class Inspector
    attr_reader :word, :results_queue

    def initialize(word)
      @word = word
      @results_queue = Queue.new
    end

    # Inspect the the configuratin resoruces
    def inspect
      Olery.configuration.resources.each do |resource|
        puts "Looking for hotels in #{resource.host} that match the word \"#{@word}\""
        result = analyze resource
        puts "#{result[:links_found]} links found in #{resource.host}"

        if result[:links_found] > 0
          link = result[:matching_link]
          puts "Queuing link #{link}"
          @results_queue << link.href
        end
        puts "\n"
      end

      @results_queue
    end

    private
    def analyze(resource)
      puts "Analyzing resource..."
      page = resource.search(@word)
      #page.links.each do |l|
      #  p "#{l.text} => #{l.href}"
      #end
      links = page.links.select {|l| l.text =~ /#{@word}/i }
      return {links_found: 0, matching_link: nil} if links.nil?

      {links_found: links.size, matching_link: links.first}
    end
  end
end
