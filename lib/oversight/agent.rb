require 'httparty'
require 'json'

module Oversight
  class Dispatch
    include HTTParty

    base_uri "http://api.oversight.dev"

    def initialize(auth_key)
      @auth_key = auth_key
    end

    def report(node_id, statuses = [])
      self.class.post('/check-ins', body: {auth_key: @auth_key,
                                           node_id:  node_id,
                                           statuses: statuses.to_json})
    end
  end

  class Agent
    def initialize(config = {})
      @config = config
    end
    
    def run
      dispatch.report(node_id)
    end

    private

    def dispatch
      Dispatch.new(auth_key)
    end

    def auth_key
      @config.fetch(:auth_key)
    end

    def node_id
      @config.fetch(:node_id)
    end
  end
end