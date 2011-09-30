require "spec_helper"

describe StatsController do
  before(:each) do
    @user = Fabricate(:user)
    use_application_as(@user, :setup_portfolio => true)
  end

  describe "GET index" do
    it "should load correctly" do
      get 'index'
      response.should be_success
      response.should render_template :index
    end
  end
end
