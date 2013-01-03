require 'oversight/agent'
require 'support/vcr_setup'

module Oversight
  describe Agent, vcr: true do
    let(:agent) { Agent.new(auth_key: "an-auth-key",
                            node_id:  "test-node") }

    it 'reports to dispatch' do
      agent.run
    end
  end
end