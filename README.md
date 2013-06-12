# GeoScraper

GeoScraper is location data (latitude/longitude) scraper.

## Installation

Add this line to your application's Gemfile:

    gem 'GeoScraper'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install GeoScraper

## Usage

    gs = GeoScraper.new(uri)
    gs.lon # get longitude
    gs.lat # get latitude

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Todo

 * To convert Geodetic Datum (WGS <-> tokyo and radian, degree). 
 * To support more site url.
 * To support exif geotag.

## Reference
http://en.wikipedia.org/wiki/Geotagging
