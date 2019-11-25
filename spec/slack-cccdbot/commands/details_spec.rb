require 'spec_helper'

describe SlackCccdbot::Commands::Details, :vcr do

  let(:message) { "#{SlackRubyBot.config.user} details #{env}" }
  
  context 'when user requests a single branch' do
    let(:env) { 'dev' }

    it 'returns the expected message' do
    	expect(message: "#{SlackRubyBot.config.user} details dev", channel: 'channel').to respond_with_slack_message("`dev` details:```{\"version_number\"=>\"NOT USED ANYMORE\", \"build_date\"=>\"2019-11-18T17:02:17+0000\", \"commit_id\"=>\"38851ee3eea3bb39e98afeccda8aaf3e0bd7bbce\", \"build_tag\"=>\"admin-38851ee3eea3bb39e98afeccda8aaf3e0bd7bbce\", \"app_branch\"=>\"master\"}```")
    end
  end

  context 'when user requests multiple branches' do
    let(:env) { 'dev, staging and live' }
    let(:response) do
      [
        "`dev` details:```{\"version_number\"=>\"NOT USED ANYMORE\", \"build_date\"=>\"2019-11-24T21:19:51+0000\", \"commit_id\"=>\"52a51b799619b6a671387c81619d1fcfa347ac6b\", \"build_tag\"=>\"app-52a51b799619b6a671387c81619d1fcfa347ac6b\", \"app_branch\"=>\"master\"}```",
        "`staging` details:```{\"version_number\"=>\"NOT USED ANYMORE\", \"build_date\"=>\"2019-11-22T14:20:54+0000\", \"commit_id\"=>\"b242676ad3c90373bbced27a00b00b4b6354950e\", \"build_tag\"=>\"app-b242676ad3c90373bbced27a00b00b4b6354950e\", \"app_branch\"=>\"master\"}```",
        "`production` details:```{\"version_number\"=>\"NOT USED ANYMORE\", \"build_date\"=>\"2019-11-22T14:20:54+0000\", \"commit_id\"=>\"b242676ad3c90373bbced27a00b00b4b6354950e\", \"build_tag\"=>\"app-b242676ad3c90373bbced27a00b00b4b6354950e\", \"app_branch\"=>\"master\"}```"
      ]
    end

    it 'displays expected, multiple, messages' do
      expect(message: message, channel: 'channel').to respond_with_slack_messages(response)
    end
  end
end
