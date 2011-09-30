require "spec_helper"

describe RemoteAccount::Facebook do

  before(:each) do
    @account = RemoteAccount::Facebook.new(:access_token => "token", :remote_user_id => 4)
  end

  it "should have a valid public name" do
    @account.public_name.should == "facebook"
  end

  describe "still_valid?" do
    it "should be valid if getting /me returns the same ID as the one stored" do
      fake_graph = Object.new
      mock(Koala::Facebook::GraphAPI).new(@account.access_token){fake_graph}
      mock(fake_graph).get_object("me"){{"id" => 4}}
      @account.should be_still_valid
    end

    it "should not be valid if getting /me returns a different ID as the one stored" do
      fake_graph = Object.new
      mock(Koala::Facebook::GraphAPI).new(@account.access_token){fake_graph}
      mock(fake_graph).get_object("me"){{"id" => 5}}
      @account.should_not be_still_valid
    end

    it "should not be valid if a call to the facebook API fails" do
      fake_graph = Object.new
      mock(Koala::Facebook::GraphAPI).new(@account.access_token){raise "Bug, sry"}
      @account.should_not be_still_valid
    end
  end

  describe "facebook_albums" do
    it "should return a valid list of albums" do
      fake_graph = Object.new
      mock(Koala::Facebook::GraphAPI).new(@account.access_token){fake_graph}
      mock(fake_graph).get_connections(4, "albums", :fields => "id,name,count", :limit => 100){[
        {"name" => "An Album", "id" => 1, "count" => 50},
        {"name" => "Another Album", "id" => 2, "count" => 40}
      ]}
      @account.facebook_albums.should == [["An Album (50 photos)", 1], ["Another Album (40 photos)", 2]]
    end

    it "should return an exception if a problem occurs" do
      e = Exception.new("bug!")
      mock(Koala::Facebook::GraphAPI).new(@account.access_token){raise e}
      @account.facebook_albums.should == e
    end
  end
end

