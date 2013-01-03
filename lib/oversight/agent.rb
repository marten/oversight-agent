require 'httparty'

module Oversight
  class Dispatch
    include HTTParty

    base_uri "http://api.oversight.dev"

    def initialize(auth_key)
      @auth_key = auth_key
    end

    def report
      self.class.post('/check-ins', body: {auth_key: @auth_key})
    end
  end

  class Agent
    def initialize(options = {})
      @dispatch = options.fetch(:dispatch) { Dispatch.new("") }
    end
    
    def run
      @dispatch.report
    end
  end
end