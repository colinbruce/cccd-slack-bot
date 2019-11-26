require 'spec_helper'

describe SlackCccdbot::Commands::Link, :vcr do

  let(:message) { "#{SlackRubyBot.config.user} link #{env}" }
  
  context 'when user requests a single branch' do
    let(:env) { 'dev' }

    it 'returns the expected message' do
    	expect(message: message, channel: 'channel').to respond_with_slack_message("Here's a link for `dev`: https://dev.claim-crown-court-defence.service.justice.gov.uk")
    end
  end

  context 'live synonyms all return the same end point and name' do
    %w[production prod live].each do |env_name|  
    	let(:env) { env_name }

    	it { expect(message: message, channel: 'channel').to respond_with_slack_message("Here's a link for `production`: https://claim-crown-court-defence.service.gov.uk") }
    end
  end
end
