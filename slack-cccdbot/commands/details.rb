require 'http'
require 'pry'

module SlackCccdbot
  module Commands
    class Details < SlackRubyBot::Commands::Base
      command 'details' do |client, data, match|

        match['expression'].split(/,\s|\s/).each do |env|
          if SlackCccdbot::Environment::NON_LIVE_ENVS.include?(env)
            built_uri = Environment.new(env).ping_page
            response = HTTP.get(built_uri)
            json = JSON.parse(response.body)

            client.say(channel: data.channel, text: "`#{env}` details:```#{json}```")
          end
        end
      end
    end
  end
end
