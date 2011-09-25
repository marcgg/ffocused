require "spec_helper"

describe RemoteAccount::InstagramAccount do
  before(:each) do
    @account = RemoteAccount::InstagramAccount.new(:access_token => "token", :remote_user_id => "4")
  end

  it "should have a valid public name" do
    @account.public_name.should == "instagram"
  end

  describe "photos" do
    it "should return the result of a call to media/recent" do
      fake_user = Object.new
      mock(Fetchers::Instalight::User).new("token"){fake_user}
      mock(fake_user).call_method("4/media/recent", ["count=100"]){"photos"}
      @account.photos.should == "photos"
    end
  end

  describe "still_valid?" do
    it "should be valid if the ID on instagram is the same as the one stored" do
      fake_user = Object.new
      mock(Fetchers::Instalight::User).new("token"){fake_user}
      mock(fake_user).call_method("self"){{"id" => "4"}}
      @account.should be_still_valid
    end

    it "should be valid if the ID on instagram is the not same as the one stored" do
      fake_user = Object.new
      mock(Fetchers::Instalight::User).new("token"){fake_user}
      mock(fake_user).call_method("self"){{"id" => "5"}}
      @account.should_not be_still_valid
    end

    it "should not be valid if a call to instagram fails" do
      fake_user = Object.new
      mock(Fetchers::Instalight::User).new("token"){raise "bug"}
      @account.should_not be_still_valid
    end

  end
end
