module SlackCccdbot
  class Bot < SlackRubyBot::Bot
  	help do
  		title 'LAA Get Paid Bot'
  		desc 'This bot assists with the Get Paid Claim for Crown Court Defence application'

			command 'api' do
				desc '`cccd api <environment>` e.g. `cccd api dev`'
				long_desc 'Get a link to the api swagger docs for a given environment'
			end

			command 'branch' do
				desc '`cccd branch <environment>` e.g. `cccd branch api-sandbox`'
				long_desc 'Shows the ping branch page for CCCD environment(s), accepts multiples e.g.  `cccd branch dev and api-sandbox` or `cccd branch dev, staging and production`'
			end

			command 'details' do
				desc '`cccd details <environment>` e.g. `cccd details staging`'
				long_desc 'Shows the ping details page for CCCD environment(s), accepts multiples e.g.  `cccd details dev and api-sandbox` or `cccd details dev, staging and production`'
			end

			command 'link' do
				desc '`cccd link <environment>`, e.g. `cccd link production`'
				long_desc 'Get a link to the login for a given environment'
			end

			command 'list' do
				desc '`cccd list`'
				long_desc 'Get a list of environments that can be passed to other commands'
			end
  	end

  	SlackRubyBot.configure do |config|
		  config.aliases = ['cccdbot', 'getpaidbot', 'cb']
		end
  end
end