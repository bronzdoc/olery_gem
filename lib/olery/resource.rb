require_relative "robot"

module Olery


  # <Resource> represents an endpoint we should hit to get the desired result page.
  class Resource
    attr_accessor :host, :action, :method, :search_key
    attr_reader :page

    def initialize(host, action, method, search_key, extra_params={})
      @host = host
      @action = action
      @method = method.downcase
      @search_key = search_key
      @extra_params = extra_params
      @bot = Olery::Robot.new.agent
    end

    # Hit the search endpoint with the specified params.
    # The params argument should include the word we are searching.
    # e.g params = {name: "DoubleTree Hilton Amsterdam"}, assuming "name"
    # is the search argument the query endpoint is expecting.
    # @returns <Mechanize::Page>
    def search(word)
      @bot.send(@method, "http://#{@host}#{@action}", {@search_key => word}.merge(@extra_params))
    end
  end
end
