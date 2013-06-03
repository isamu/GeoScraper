require "open-uri"
require "nokogiri"

class GeoScraper
  @@pattern = []

  @url = ""
  @matches = nil
  @result = nil

  def initialize url
    @url = url
    @@pattern.each do |pattern|
      if @matches = pattern[0].match(@url)
        extend Object.const_get("GeoScraper::" + pattern[1])
        @matches = Regexp.last_match
        @result = scrape
        break
      end
    end
  end

  def get_doc uri
    Nokogiri::HTML.parse(open(uri, "User-Agent" => "Mozilla/5.0 Geo Scraper").read)
  end

  def has_data?
    !@result.nil?
  end

  def lon
    if  has_data?
      @result["longitude"].to_f
    end
  end

  def lat
    if  has_data?
      @result["latitude"].to_f
    end
  end

end

