require 'spec_helper'

describe SlackCccdbot::Commands::List do
  subject { SlackCccdbot::Bot.instance }

  let(:message) { "#{SlackRubyBot.config.user} list" }
  let(:response) {
  <<~TEXT
    You can use the following values to query commands:
    `dev`
    `api-sandbox`
    `staging`
    `production`, will also accept `live` or `prod`
  TEXT
  }
  it 'returns the expected message' do
    expect(message: message, channel: 'channel').to respond_with_slack_message(response)
  end
end
