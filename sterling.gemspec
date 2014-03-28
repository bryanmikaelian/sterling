# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sterling/version'

Gem::Specification.new do |spec|
  spec.name          = "sterling"
  spec.version       = Sterling::VERSION
  spec.authors       = ["Bryan Mikaelian"]
  spec.email         = ["bryan@puhsh.com"]
  spec.summary       = %q{An API wrapper for the Retailigence API}
  spec.description   = %q{This is a ruby gem that can be used to interact with the Retailigence API. The responses are nicely formatted into a simple Hash that lets you work with the response quite nicely..}
  spec.homepage      = "http://developer.puhsh.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec', '~> 2.14.1'
  spec.add_development_dependency 'vcr', '~> 2.8.0'
  spec.add_development_dependency 'webmock'

  spec.add_dependency 'activesupport', '~> 3.2.17'
  spec.add_dependency 'faraday', '0.9.0'
  spec.add_dependency 'crack', '~> 0.4.1'
end
