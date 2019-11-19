require 'spec_helper'

describe SlackCccdbot::Commands::Api, :vcr do
  def app
    SlackCccdbot::Bot.instance
  end

  subject { app }

  xit 'returns the expected message' do
    expect(message: "#{SlackRubyBot.config.user} api dev", channel: 'channel').to respond_with_slack_message("Here's an API link for `dev`: https://dev.claim-crown-court-defence.service.justice.gov.uk/api/documentation")
  end
end
