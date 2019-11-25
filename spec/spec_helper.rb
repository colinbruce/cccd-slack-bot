$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..'))

require 'slack-ruby-bot/rspec'
require 'slack-cccdbot/bot'
require 'slack-cccdbot/environment'
require 'slack-cccdbot/commands/branch'
require 'slack-cccdbot/commands/details'
require 'slack-cccdbot/commands/link'
require 'slack-cccdbot/commands/list'
require 'slack-cccdbot/commands/api'
require 'vcr_helper'
require 'dotenv'

Dotenv.load('.env.test')
