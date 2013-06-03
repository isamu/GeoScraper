require 'spec_helper'

describe GeoScraper do
  before do
  end

  it 'should get geo data from foursquare' do
    uri = "https://ja.foursquare.com/v/%E6%9D%B1%E4%BA%AC%E3%83%89%E3%83%BC%E3%83%A0-tokyo-dome/4b7544c3f964a520a8032ee3"
    gs = GeoScraper.new(uri)
    
    gs.lon.should == 139.7519087791443
    gs.lat.should == 35.705584611645335
  end
  
  it 'should get geo data from yelp' do
    uri = "http://www.yelp.com/biz/greenhearts-family-farm-csa-san-francisco"
    gs = GeoScraper.new(uri)
    
    gs.lon.should == -122.4355626
    gs.lat.should == 37.7733623
  end

  it 'should get geo data from 30min' do
    gs = GeoScraper.new "http://30min.jp/place/5561"
    
    gs.lon.should == 139.78297
    gs.lat.should == 35.684971
  end

  it 'should get geo data from gnavi' do
    gs = GeoScraper.new "http://r.gnavi.co.jp/g398542/map/"
    
    gs.lon.should == 139.77357
    gs.lat.should == 35.627817
  end  

  it 'should get geo data from tabelog' do
    uri = "http://tabelog.com/tokyo/A1311/A131102/13003661/dtlmap/"
    gs = GeoScraper.new(uri)
    
    gs.lon.should == 139.795076693823
    gs.lat.should == 35.7104300850057
  end

  it 'should get geo data from tabelog no map url' do
    uri = "http://tabelog.com/tokyo/A1311/A131102/13003661/"
    gs = GeoScraper.new(uri)
    
    gs.lon.should == 139.795076693823
    gs.lat.should == 35.7104300850057
  end
end
