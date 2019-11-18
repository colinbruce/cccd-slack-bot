require 'http'

module SlackCccdbot
  module Commands
    class Api < SlackRubyBot::Commands::Base
      command 'api' do |client, data, match|
        env = match['expression']
        if SlackCccdbot::Environment::NON_LIVE_ENVS.include?(env)
          built_uri = Environment.new(env).api_page
          good_result = "Here's an API link for `#{env}`: #{built_uri}"
          bad_result = "Sorry, can't connect to `#{env}` right now! :thinking_face:"
          response = HTTP.timeout(3).get(built_uri).status
          result = response.eql?(200) ? good_result : bad_result
          client.say(channel: data.channel, text: result)
        end
      rescue HTTP::TimeoutError
        client.say(channel: data.channel, text: bad_result)
      end
    end
  end
end
