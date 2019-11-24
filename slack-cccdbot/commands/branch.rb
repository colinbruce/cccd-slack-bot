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

          branch = json['app_branch']
          author = HTTP.get("https://api.github.com/repos/#{ENV['GITHUB_ORG']}/#{ENV['GITHUB_REPO']}/branches/#{branch}")

          client.say(channel: data.channel, text: "`production` is running the `#{branch}` branch")
        else
          match['expression'].split(/,\s|\s/).each do |env|
            next unless SlackCccdbot::Environment::NON_LIVE_ENVS.include?(env)

            built_uri = Environment.new(env).ping_page
            response = HTTP.get(built_uri)
            json = JSON.parse(response.body)

            branch = json['app_branch']

            if branch.eql?('master')
              branch_text = "the `master` branch"
            else
              gh_response = HTTP.get("https://api.github.com/repos/#{ENV['GITHUB_ORG']}/#{ENV['GITHUB_REPO']}/branches/#{branch}")
              author = JSON.parse(gh_response.body)['commit']['author']['login']
              branch_text = "#{author}'s `#{branch}` branch"
            end
            client.say(channel: data.channel, text: "`#{env}` is running #{branch_text}")
          end
        end
      end
    end
  end
end
