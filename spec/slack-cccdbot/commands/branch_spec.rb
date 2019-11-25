require 'spec_helper'

describe SlackCccdbot::Commands::Branch, :vcr do
  def app
    SlackCccdbot::Bot.instance
  end

  subject { app }

  it 'returns the expected message' do
    expect(message: "#{SlackRubyBot.config.user} branch dev", channel: 'channel').to respond_with_slack_message('`dev` is running the `master` branch')
  end

  context 'when user requests all branches' do

    let(:response) do
      [
        "`dev` is running colinbruce's `VCR-test-branch` branch",
        '`staging` is running the `master` branch',
        '`api-sandbox` is running the `master` branch',
        '`production` is running the `master` branch'
      ]
    end

  	it 'displays 5 messages' do
      expect(message: "#{SlackRubyBot.config.user} branch all", channel: 'channel').to respond_with_slack_messages(response)
  	end
  end
end
