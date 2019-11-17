require 'http'
require 'pry'

module SlackCccdbot
  module Commands
    class Branch < SlackRubyBot::Commands::Base
      command 'branch' do |client, data, match|
        if match['expression'].eql?('all')
          SlackCccdbot::Environment::NON_LIVE_ENVS.each do |env|
            built_uri = Environment.new(env).ping_page
            response = HTTP.get(built_uri)
            json = JSON.parse(response.body)

            client.say(channel: data.channel, text: "`#{env}` is running the `#{json['app_branch']}` branch")
          end
          built_uri = "https://#{LIVE_ENV}/ping.json"
          response = HTTP.get(built_uri)
          json = JSON.parse(response.body)

          client.say(channel: data.channel, text: "`production` is running the `#{json['app_branch']}` branch")
        else
          match['expression'].split(/,\s|\s/).each do |env|
            next unless SlackCccdbot::Environment::NON_LIVE_ENVS.include?(env)

            built_uri = Environment.new(env).ping_page
            response = HTTP.get(built_uri)
            json = JSON.parse(response.body)

            client.say(channel: data.channel, text: "`#{env}` is running the `#{json['app_branch']}` branch")
          end
        end
      end
    end
  end
end
