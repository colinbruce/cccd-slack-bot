require 'spec_helper'

describe SlackCccdbot::Commands::Details, :vcr do
  def app
    SlackCccdbot::Bot.instance
  end

  subject { app }

  it 'returns the expected message' do
    expect(message: "#{SlackRubyBot.config.user} details dev", channel: 'channel').to respond_with_slack_message("`dev` details:```{\"version_number\"=>\"NOT USED ANYMORE\", \"build_date\"=>\"2019-11-18T17:02:17+0000\", \"commit_id\"=>\"38851ee3eea3bb39e98afeccda8aaf3e0bd7bbce\", \"build_tag\"=>\"admin-38851ee3eea3bb39e98afeccda8aaf3e0bd7bbce\", \"app_branch\"=>\"master\"}```")
  end
end
