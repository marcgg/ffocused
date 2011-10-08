require "spec_helper"

describe RemoteAccountsController do

  before(:each) do
    @user = Fabricate(:user)
    @portfolio = @user.portfolio
    use_application_as(@user, :setup_portfolio => true)
  end

  describe "GET index" do
    it "should work" do
      get "index"
      response.should be_success
      response.should render_template :index
      assigns(:remote_accounts).should == @portfolio.remote_accounts
    end
  end

  describe "DELETE destroy" do
    it "should work" do
      RemoteAccount.count.should == 1
      delete "destroy", :id => @portfolio.remote_accounts.last.id
      response.should be_success
      RemoteAccount.count.should == 0
    end
  end

  describe "GET expired" do
    it "should work" do
      get "expired", :id => @portfolio.remote_accounts.last.id
      response.should be_success
      response.should render_template :expired
    end
  end

  describe "POST create" do
    it "should raise an error if an invalid remote account is passed" do
      lambda{
        post "create", :type => "GooglePlus"
      }.should raise_error
    end
  end

end
