module SlackCccdbot
  class Bot < SlackRubyBot::Bot
  	help do
  		title 'LAA Get Paid Bot'
  		desc 'This bot assists with the Get Paid Claim for Crown Court Defence application'

  		command 'branch' do
  			desc 'Shows the branch deployed on CCCD environments'
  			long_desc 'Queries the given environment(s) and displays the branch name currently deployed'
			end

  		command 'details' do
  			desc 'Shows the ping details page on CCCD environments'
  			long_desc 'Queries the given environment(s) and displays the branch name currently deployed'
			end
  	end
  end
end