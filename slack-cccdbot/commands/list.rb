module SlackCccdbot
  module Commands
    class List < SlackRubyBot::Commands::Base
      command 'list' do |client, data, _match|
        client.say(channel: data.channel, text: "Envs: `dev`\n`api-sandbox`\n`staging`\n`production`")
      end
    end
  end
end
