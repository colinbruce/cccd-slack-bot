require 'spec_helper'

describe SlackCccdbot::Commands::Branch, :vcr do
  subject { SlackCccdbot::Bot.instance }

  let(:message) { "#{SlackRubyBot.config.user} branch #{env}" }
  
  context 'when user requests a single branch' do
    let(:env) { 'dev' }

    it 'returns the expected message' do
      expect(message: message, channel: 'channel').to respond_with_slack_message('`dev` is running the `master` branch')
    end
  end

  context 'when user requests multiple branches' do
    let(:env) { 'dev, staging and live' }
    let(:response) do
      [
        "`dev` is running colinbruce's `VCR-test-branch` branch",
        '`staging` is running the `master` branch',
        '`production` is running the `master` branch'
      ]
    end

    it 'ignores formatting and displays expected messages' do
      expect(message: message, channel: 'channel').to respond_with_slack_messages(response)
    end
  end

  context 'when user requests all branches' do
    let(:env) { 'all' }
    let(:response) do
      [
        "`dev` is running colinbruce's `VCR-test-branch` branch",
        '`staging` is running the `master` branch',
        '`api-sandbox` is running the `master` branch',
        '`production` is running the `master` branch'
      ]
    end

    it 'displays 5 messages' do
      expect(message: message, channel: 'channel').to respond_with_slack_messages(response)
    end
  end
end
