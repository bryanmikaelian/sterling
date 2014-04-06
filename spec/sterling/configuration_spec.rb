require 'spec_helper'

describe Sterling do

  it 'can set the API Version' do
    Sterling.configure do |config|
      config.api_version = '1'
    end

    expect(Sterling.configuration.api_version).to eql('1')
  end

  it 'can set the API Key' do
    Sterling.configure do |config|
      config.api_key = 'abcd'
    end

    expect(Sterling.configuration.api_key).to eql('abcd')
  end
end
