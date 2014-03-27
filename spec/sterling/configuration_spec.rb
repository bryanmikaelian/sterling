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

  it 'can set the Retailer ID' do
    Sterling.configure do |config|
      config.retailer_id = '12345'
    end
    expect(Sterling.configuration.retailer_id).to eql('12345')
  end
end
