require 'overwatch/agent'

module Overwatch
  describe Agent do
    let(:dispatch) { stub }
    let(:agent) { Agent.new(dispatch: dispatch) }

    it 'reports to dispatch' do
      dispatch.should_receive(:report).once
      agent.run
    end
  end
end