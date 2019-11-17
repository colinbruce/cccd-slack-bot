module SlackCccdbot
  # returns an environment class with uri properties
  class Environment
    URI_SUFFIX = '.claim-crown-court-defence.service.justice.gov.uk'.freeze
    NON_LIVE_ENVS = %w[dev staging api-sandbox].freeze
    LIVE_ENV = 'cccd-production.apps.live-1.cloud-platform.service.justice.gov.uk'.freeze

    def initialize(name)
      @name = name
    end

    def url
      return unless NON_LIVE_ENVS.include?(@name)

      "https://#{@name}#{URI_SUFFIX}"
    end

    def ping_page
      "#{url}/ping.json"
    end
  end
end
