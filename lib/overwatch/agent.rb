module Overwatch
  class Agent
    def initialize(options = {})
      @dispatch = options.fetch(:dispatch)
    end
    
    def run
      @dispatch.report
    end
  end
end