class GeoScraper
  @@pattern << [/http:\/\/www\.yelp\.com\//, "Yelp"]
  
  module Yelp
    def scrape
      doc = get_doc @url

      meta = doc.css('meta').inject({}) {|s, v|
        s[v.attr('property')] ||= v.attr('content')
        s[v.attr('name')] ||= v.attr('content')
        s
      }
      {
        "longitude" => meta['place:location:longitude'],
        "latitude" => meta['place:location:latitude']
      }
    end
  end
end
