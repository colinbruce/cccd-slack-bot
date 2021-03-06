module SlackCccdbot
  # returns an environment class with uri properties
  class Environment
    URI_SUFFIX = '.claim-crown-court-defence.service.justice.gov.uk'.freeze
    NON_LIVE_ENVS = %w[dev staging api-sandbox].freeze
    LIVE_URI = 'claim-crown-court-defence.service.gov.uk'.freeze
    LIVE_ENV_SYNONYMS = %w[production prod live].freeze

    def self.valid?(name)
      NON_LIVE_ENVS.include?(name) || LIVE_ENV_SYNONYMS.include?(name)
    end

    def initialize(name)
      @name = name
    end

    def url
      @url ||= if NON_LIVE_ENVS.include?(@name)
                 "https://#{@name}#{URI_SUFFIX}"
               elsif LIVE_ENV_SYNONYMS.include?(@name)
                 "https://#{LIVE_URI}"
               end
    end

    def ping_page
      "#{url}/ping.json"
    end

    def api_page
      "#{url}/api/documentation"
    end

    def name
      if LIVE_ENV_SYNONYMS.include?(@name)
        'production'
      elsif NON_LIVE_ENVS.include?(@name)
        @name
      else
        'unknown'
      end
    end
  end
end
