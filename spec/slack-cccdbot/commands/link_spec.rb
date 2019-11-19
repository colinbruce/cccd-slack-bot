require 'spec_helper'

describe SlackCccdbot::Commands::Link, :vcr do
  def app
    SlackCccdbot::Bot.instance
  end

  subject { app }

  it 'returns the expected message' do
    expect(message: "#{SlackRubyBot.config.user} link dev", channel: 'channel').to respond_with_slack_message("Here's a link for `dev`: https://dev.claim-crown-court-defence.service.justice.gov.uk")
  end
end
