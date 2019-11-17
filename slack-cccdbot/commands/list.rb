require 'http'
require 'pry'

module SlackCccdbot
  module Commands

    URI_SUFFIX = '.claim-crown-court-defence.service.justice.gov.uk'
    NON_LIVE_ENVS = [ 'dev', 'staging', 'api-sandbox' ]
    LIVE_ENV = ['cccd-production.apps.live-1.cloud-platform.service.justice.gov.uk']

    class List < SlackRubyBot::Commands::Base
      command 'list' do |client, data, match|

        match['expression'].split(/,\s|\s/).each do |env|
          if NON_LIVE_ENVS.include?(env)
            client.say(channel: data.channel, text: "Show data for `#{env}`")
          end
        end
      end
    end
  end
end