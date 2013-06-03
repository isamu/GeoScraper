class GeoScraper
  @@pattern << [/^http:\/\/30min.jp\/place/, "SanzeroMin"]

  module SanzeroMin
    def scrape
      doc = get_doc @url

      lon = nil
      lat = nil
      doc.css("script").select{|script|
        script.inner_text.match(/SZAreaMatch/)
      }[0].inner_text.split("\n").each {|line| 
        if line =~ /SZAreaMatch\.longitude/ 
          lon = line.scan(/^\-|\d[\d\-\.]+/)[0]
        elsif line =~ /SZAreaMatch\.latitude/
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
