require "spec_helper"

describe Fetchers::Instalight do
  it "should have valid setup variables" do
    Fetchers::Instalight::BASE_URL.should == "https://api.instagram.com/v1/"
    Fetchers::Instalight::VERBOSE.should == true
    Fetchers::Instalight::FORMAT.should == "json"
  end

  it "should be setup with an access token" do
    user = Fetchers::Instalight::User.new("token")
    user.access_token.should == "token"
  end

  describe "call_method" do
    it "should be able to call any method" do
      user = Fetchers::Instalight::User.new("token")
      fake_res = Object.new
      mock(fake_res).body_str{'{"meta": {"code": 200}, "data": "some data"}'}
      mock(Curl::Easy).http_get("https://api.instagram.com/v1/users/self?access_token=token&"){fake_res}
      res = user.call_method("self")
      res.should == "some data"
    end
  end
end


