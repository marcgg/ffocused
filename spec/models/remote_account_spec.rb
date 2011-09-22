require "spec_helper"

describe RemoteAccount do
  it "should have 3 available accounts" do
    RemoteAccount::AVAILABLE_ACCOUNTS.size.should == 3
    RemoteAccount::AVAILABLE_SUBCLASSES.size.should == 3
  end

  it "should have a class_name based on its class" do
    RemoteAccount.new.class_name.should == "remoteaccount"
  end
end
