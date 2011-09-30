require "spec_helper"

describe FutureUsersController do

  describe "POST create" do
    it "should work" do
      post "create", :email => "test@test.com"
      response.should be_success
      FutureUser.count.should == 1
      FutureUser.first.email.should == "test@test.com"
    end
  end
end
