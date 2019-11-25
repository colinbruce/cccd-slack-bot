require 'spec_helper'

describe SlackCccdbot::Environment do
  subject(:environment) { described_class.new(env_name) }

  context 'when passed a non-live env name' do
    let(:env_name) { 'dev' }

    describe '.url' do
      subject(:url) { environment.url }

      it { is_expected.to eql("https://dev.claim-crown-court-defence.service.justice.gov.uk") }
    end

    describe '.ping_page' do
      subject(:ping_page) { environment.ping_page }

      it { is_expected.to eql("https://dev.claim-crown-court-defence.service.justice.gov.uk/ping.json") }
    end

    describe '.api_page' do
      subject(:api_page) { environment.api_page }

      it { is_expected.to eql("https://dev.claim-crown-court-defence.service.justice.gov.uk/api/documentation") }
    end
  end

  context 'when passed a live synonym' do
    let(:env_name) { 'prod' }

    describe '.url' do
      subject(:url) { environment.url }

      it { is_expected.to eql("https://claim-crown-court-defence.service.gov.uk") }
    end

    describe '.ping_page' do
      subject(:ping_page) { environment.ping_page }

      it { is_expected.to eql("https://claim-crown-court-defence.service.gov.uk/ping.json") }
    end

    describe '.api_page' do
      subject(:api_page) { environment.api_page }

      it { is_expected.to eql("https://claim-crown-court-defence.service.gov.uk/api/documentation") }
    end
  end

  context 'live synonyms all return the same end point' do
    let(:expected_url) { "https://claim-crown-court-defence.service.gov.uk" }

    %w[production prod live].each do |env_name|  
      it { expect(described_class.new(env_name).url).to eql(expected_url) }
    end
  end
end
