# Sterling - A Retailigence API Wrapper

![Sterling Cooper](http://www.campaignbrief.com/nz/Sterling-Cooper-logo.png)

Sterling is a simple wrapper for the [Retailigence API](http://www.retailigence.com/) written in Ruby. The name was inspired from Sterling Cooper, the fictional ad agency from Mad Men.

[![Build Status](https://travis-ci.org/puhsh/sterling.svg?branch=master)](https://travis-ci.org/puhsh/sterling)
[![Code Climate](https://codeclimate.com/github/puhsh/sterling.png)](https://codeclimate.com/github/puhsh/sterling)

### Installation

```
gem install sterling
```

### Configuration

Sterling is designed to be dropped into a Rails app with little effort. Simply create an initializer as follows

```ruby
Sterling.configure do |config|
  config.api_version = '...'
  config.api_key = 'your api key'
  config.retailer_id = 'your requestor id'
  config.api_host = 'api or apitest'
end
```

### Usage

Once configured, you can create a new client object. This object is used to interact with the Retailigence API.

```ruby
client = Sterling::API::Client.new

# Return an array of product objects for the location 90210 that match the keyword Diamonds
products = client.products("90201", "Diamonds")

# Get the product names
products.each do |search_result|
  puts search_result.product['name']
end
```

In the event no data is found, the response simply returns an empty array.


### Roadmap
1. Additional Endpoints

### Contributing
Think we need to improve the gem? Missing features? Want more support? Feel this ruby could be better? Contribute away!

1. Fork it
2. Make your changes and use specs (rpsec is preferred)
3. Pull Request

We, at Puhsh, use Sterling extensively in production and we are always open to making it better.
