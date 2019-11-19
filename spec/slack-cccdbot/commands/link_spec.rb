require 'spec_helper'

describe SlackCccdbot::Commands::Link, :vcr do
  def app
    SlackCccdbot::Bot.instance
  end

  subject { app }

  xit 'returns the expected message' do
    expect(message: "#{SlackRubyBot.config.user} link dev", channel: 'channel').to respond_with_slack_message('bob')
  end
end
