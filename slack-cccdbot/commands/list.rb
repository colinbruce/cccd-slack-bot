module SlackCccdbot
  module Commands
    class List < SlackRubyBot::Commands::Base
      command 'list' do |client, data, _match|
        client.say(channel: data.channel, text: 'list environments')
      end
    end
  end
end