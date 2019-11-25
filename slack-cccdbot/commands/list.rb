module SlackCccdbot
  module Commands
    class List < SlackRubyBot::Commands::Base
      command 'list' do |client, data, _match|
        response = <<~TEXT
          You can use the following values to query commands:
          `dev`
          `api-sandbox`
          `staging`
          `production`

          Valid variants for `production` are `live` or `prod`
        TEXT
        client.say(channel: data.channel, text: response)
      end
    end
  end
end
