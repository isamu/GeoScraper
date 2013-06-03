class GeoScraper
  @@pattern << [/http:\/\/tabelog\.com(\/[A-Za-z\d]+){4}/, "Tabelog"]
  
  module Tabelog
    def scrape
      url = @matches[0] + "/dtlmap/"
      doc = get_doc url

      lon = nil
      lat = nil
      doc.css("script").select{|script|
        script.inner_text.match(/LatLng/)
      }[0].inner_text.split("\n").each {|line| 
        if line =~ /var\ lng/ 
          lon = line.scan(/^\-|\d[\d\-\.]+/)[0]
        elsif line =~ /var\ lat/
          lat = line.scan(/^\-|\d[\d\-\.]+/)[0]
        end
      }
      {
        "longitude" => lon,
        "latitude" => lat
      }

    end
  end
end
