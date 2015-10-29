require "mechanize"

module Olery
  # <Robot> will act as a user agent, making request to
  # specified endpoints
  class Robot
    attr_reader :agent

    # List of valid user agents for the robot.
    # To see the complete list of valid agents for mechanize,
    # go to https://github.com/sparklemotion/mechanize/blob/master/lib/mechanize.rb#L115
    USER_AGENTS = [
      "Mac Safari",
      "Mac Mozilla",
    ]

    def initialize
      @agent = Mechanize.new do |agent|
        agent.user_agent_alias = USER_AGENTS.sample
      end
    end

  end
end
