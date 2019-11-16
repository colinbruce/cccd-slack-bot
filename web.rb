require 'sinatra/base'

module SlackCccdbot
  class Web < Sinatra::Base
    get '/' do
      'CCCD helper bot'
    end
  end
end
