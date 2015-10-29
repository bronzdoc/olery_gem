module Olery
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_reader :resources

    def initialize
      @resources = []
    end

    def add(resource)
      @resources << resource
    end
  end
end
