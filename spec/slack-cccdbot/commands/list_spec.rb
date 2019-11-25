require 'spec_helper'

describe SlackCccdbot::Commands::List do
  subject { SlackCccdbot::Bot.instance }

  let(:message) { "#{SlackRubyBot.config.user} list" }

  it 'returns the expected message' do
    expect(message: message, channel: 'channel').to respond_with_slack_message("Envs: `dev`\n`api-sandbox`\n`staging`\n`production`")
  end
end
