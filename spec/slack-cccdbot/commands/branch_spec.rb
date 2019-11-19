require 'spec_helper'

describe SlackCccdbot::Commands::Branch, :vcr do
  def app
    SlackCccdbot::Bot.instance
  end

  subject { app }

  it 'returns the expected message' do
    expect(message: "#{SlackRubyBot.config.user} branch dev", channel: 'channel').to respond_with_slack_message('`dev` is running the `master` branch')
  end
end
