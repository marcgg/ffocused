require "spec_helper"

describe Fetchers::Flickr do
  it "should be have valid setup variables" do
    Fetchers::Flickr::BASE_URL.should == "http://api.flickr.com/services/rest/"
    Fetchers::Flickr::VERBOSE.should == true
    Fetchers::Flickr::FORMAT.should == "json"
  end

  describe Fetchers::Flickr::Request do
    it "should be able to call any method" do
      fake_result = Object.new
      mock(fake_result).body_str{'jsonFlickrApi({"user":{"id":"33709209@N08", "nsid":"33709209@N08", "username":{"_content":"marcgg"}}, "stat":"ok"})'}
      mock(Curl::Easy).http_get("http://api.flickr.com/services/rest/?method=flickr.people.findByEmail&format=json&api_key=15308080fe510399d83e2b185ed1a073&find_email=marcg.gauthier@yahoo.com"){ fake_result }
      res = Fetchers::Flickr::Request.call_method("people.findByEmail", {:find_email => "marcg.gauthier@yahoo.com"})
      res.should == {"user"=>{"id"=>"33709209@N08", "nsid"=>"33709209@N08", "username"=>{"_content"=>"marcgg"}}, "stat"=>"ok"}
    end
  end
end
