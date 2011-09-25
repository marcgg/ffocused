require "spec_helper"

describe RemoteAccount::Flickr do
  before(:each) do
    @account = RemoteAccount::Flickr.new(:remote_user_id => "4", :remote_user_email => "email")
  end

  it "should always be valid since we don't require authorization" do
    @account.should be_still_valid
  end

  it "should have a valid public name" do
    @account.public_name.should == "flickr"
  end

  it "should retrieve the flickr sets" do
    mock(Fetchers::Flickr::Request).call_method("photosets.getList", {:user_id => "4"}){
      {"photosets" =>
        {
          "photoset" => [
            {"title" => {"_content" => "A nice photo"}, "id" => "123"},
            {"title" => {"_content" => "Another  photo"}, "id" => "456"}
          ]
        }
      }
    }
    @account.flickr_sets.should == [["A nice photo", "123"], ["Another  photo", "456"]]
  end

  it "should return an empty array if there is no photosets" do
    mock(Fetchers::Flickr::Request).call_method("photosets.getList", {:user_id => "4"}){
      {}
    }
    @account.flickr_sets.should be_empty
  end

  describe "check_and_save_flickr_user_id" do
    it "should fail if the call to flickr fails" do
      mock(Fetchers::Flickr::Request).call_method("people.findByEmail", {:find_email => "email"}){
        {"stat" => "fail"}
      }
      @account.check_and_save_flickr_user_id
      @account.errors[:remote_user_email].should include "bug"
    end

    it "should set the information found on flickr if call succeeds" do
      mock(Fetchers::Flickr::Request).call_method("people.findByEmail", {:find_email => "email"}){
        {
          "stat" => "success",
          "user" => {"nsid" => "123", "username" => {"_content" => "marcgg"}}
        }
      }
      @account.check_and_save_flickr_user_id
      @account.remote_user_id.should == "123"
      @account.remote_user_name.should == "marcgg"
    end
  end
end
