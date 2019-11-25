require 'http'

module SlackCccdbot
  module Commands
    class Branch < SlackRubyBot::Commands::Base
      GITHUB_URI = 'https://api.github.com/repos/'.freeze

      def self.ping_data(env)
        built_uri = Environment.new(env).ping_page
        response = HTTP.get(built_uri)
        JSON.parse(response.body)
      end

      def self.get_branch_author(branch_name)
        gh_response = HTTP.get("#{GITHUB_URI}#{ENV['GITHUB_ORG']}/#{ENV['GITHUB_REPO']}/branches/#{branch_name}")
        JSON.parse(gh_response.body)['commit']['author']['login']
      end

      command 'branch' do |client, data, match|
        if match['expression'].eql?('all')
          SlackCccdbot::Environment::NON_LIVE_ENVS + %w[prod].each do |env|
            branch = ping_data(env)['app_branch']
            if branch.eql?('master')
              branch_text = 'the `master` branch'
            else
              author = get_branch_author(branch)
              branch_text = "#{author}'s `#{branch}` branch"
            end
            client.say(channel: data.channel, text: "`#{env}` is running #{branch_text}")
          end
        else
          match['expression'].split(/,\s|\s/).each do |env|
            return unless SlackCccdbot::Environment.valid?(env)

            branch = ping_data(env)['app_branch']
            if branch.eql?('master')
              branch_text = 'the `master` branch'
            else
              author = get_branch_author(branch)
              branch_text = "#{author}'s `#{branch}` branch"
            end
            client.say(channel: data.channel, text: "`#{env}` is running #{branch_text}")
          end
        end
      end
    end
  end
end
