class GeoScraper
  @@pattern << [/https?:\/\/(\w+\.)?foursquare.com\//, "FourSquare"]

  module FourSquare
    def scrape
      doc = get_doc @url
      meta = doc.css('meta').inject({}) {|s, v|
        s[v.attr('property')] ||= v.attr('content')
        s[v.attr('name')] ||= v.attr('content')
        s
      }
      {
        "longitude" => meta["playfoursquare:location:longitude"],
        "latitude" => meta["playfoursquare:location:latitude"]
      }
    end
  end
end
