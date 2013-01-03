require 'oversight/agent'
require 'support/vcr_setup'

module Oversight
  describe Dispatch, vcr: true do
    let(:dispatch) { Dispatch.new("auth-key") }

    it 'posts to api server' do
      dispatch.report
    end
  end
  
  describe Agent do
    let(:dispatch) { stub }
    let(:agent) { Agent.new(dispatch: dispatch) }

    it 'reports to dispatch' do
      dispatch.should_receive(:report).once
      agent.run
    end
  end
end