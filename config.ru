$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'dotenv'
Dotenv.load

require 'slack_cccdbot'
require 'web'

Thread.abort_on_exception = true

Thread.new do
  SlackCccdbot::Bot.run
rescue StandardError => e
  warn "ERROR: #{e}"
  warn e.backtrace
  raise e
end

run SlackCccdbot::Web
