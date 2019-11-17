module SlackCccdbot
  URI_SUFFIX = '.claim-crown-court-defence.service.justice.gov.uk'
  NON_LIVE_ENVS = [ 'dev', 'staging', 'api-sandbox' ]
  LIVE_ENV = 'cccd-production.apps.live-1.cloud-platform.service.justice.gov.uk'

  class Environment

    def initialize(name)
      @name = name
    end

    def url
      if NON_LIVE_ENVS.include?(@name)
        "https://#{@name}#{URI_SUFFIX}"
      end
    end

    def ping_page
      "#{url}/ping.json"
    end
  end
end
