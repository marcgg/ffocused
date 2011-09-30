require "spec_helper"

describe StatsController do
  before(:each) do
    @user = Fabricate(:user)
    use_application_as(@user, :setup_portfolio => true)
  end

  describe "GET index" do
    it "should load all the activated and printed photos" do
      get 'index'
      puts response.body
      response.should be_success
      response.should render_template :index
      assigns(:photos).should == "lole"
    end
  end
end
