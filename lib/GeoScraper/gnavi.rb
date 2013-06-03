class GeoScraper
  @@pattern << [/http:\/\/r\.gnavi\.co\.jp\/(\w+)\//, "Gnavi"]

  module Gnavi
    def scrape
      uri = "http://r.gnavi.co.jp/#{@matches[1]}/map/"
      
      doc = get_doc(uri)
      if figureCanvas = doc.xpath("//div[@id='figureCanvas']")
        value = figureCanvas[0].attributes["class"].value
        geo = value.split(" ").inject({}){|s, v|
          values = v.split(":")
          s[values[0]] = values[1]
          s
        }
      end
      { 
        "longitude" => geo["lng"],
        "latitude" => geo["lat"]
      }
    end
    
  end
end
