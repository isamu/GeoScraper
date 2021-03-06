# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'GeoScraper/version'

Gem::Specification.new do |spec|
  spec.name          = "GeoScraper"
  spec.version       = GeoScraper::VERSION
  spec.authors       = ["isamu arimoto"]
  spec.email         = ["isamu@to-kyo.to"]
  spec.description   = %q{GeoScraper is location data (latitude/longitude) scraper.}
  spec.summary       = %q{GeoScraper is location data (latitude/longitude) scraper.}
  spec.homepage      = "https://github.com/isamu/GeoScraper"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"  

  spec.add_dependency "nokogiri"

end
