require 'http'
require 'pry'

module SlackCccdbot
  module Commands

    URI_SUFFIX = '.claim-crown-court-defence.service.justice.gov.uk'
    NON_LIVE_ENVS = [ 'dev', 'staging', 'api-sandbox' ]
    LIVE_ENV = 'cccd-production.apps.live-1.cloud-platform.service.justice.gov.uk'

    class Branch < SlackRubyBot::Commands::Base
      command 'branch' do |client, data, match|
        if match['expression'].eql?('all')
          NON_LIVE_ENVS.each do |env|
            built_uri = "https://#{env}#{URI_SUFFIX}/ping.json"
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
            if NON_LIVE_ENVS.include?(env)

              built_uri = "https://#{env}#{URI_SUFFIX}/ping.json"
              response = HTTP.get(built_uri)
              json = JSON.parse(response.body)

              client.say(channel: data.channel, text: "`#{env}` is running the `#{json['app_branch']}` branch")
            end
          end
        end
      end
    end
  end
end
