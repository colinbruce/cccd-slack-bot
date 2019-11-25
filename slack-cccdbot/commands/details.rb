require 'http'

module SlackCccdbot
  module Commands
    class Details < SlackRubyBot::Commands::Base
      command 'details' do |client, data, match|
        match['expression'].split(/,\s|\s/).each do |env|
          next unless SlackCccdbot::Environment.valid?(env)

          environment = Environment.new(env)
          built_uri = environment.ping_page
          response = HTTP.get(built_uri)
          json = JSON.parse(response.body)

          client.say(channel: data.channel, text: "`#{environment.name}` details:```#{json}```")
        end
      end
    end
  end
end
