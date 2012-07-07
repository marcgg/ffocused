require "spec_helper"

describe ForgottenPasswordsController do

  before(:each) do
    @user = Fabricate(:user)
  end

  describe "GET new" do
    it "should load correctly if not logged in" do
      get "new"
      response.should be_success
      response.should render_template :new
    end

    it "should not load correctly if logged in" do
      use_application_as(@user, :setup_portfolio => true)
      get "new"
      response.should_not be_success
      response.should redirect_to :controller => :home, :action => :index
    end
  end

  describe "POST create" do
    it "should fail if the login is incorrect" do
      post "create", :user_session => {:login => "IncorrectLogin"}
      response.should_not redirect_to :action => :new
      response.should render_template :new
    end

    it "should email the user instructions" do
      post "create", :user_session => {:login => "MyLogin"}
      last_email.to.should include(@user.email)
      response.should redirect_to :action => :new
    end

    it "should reset the user's perishable token" do
      post "create", :user_session => {:login => "MyLogin"}
      @user.perishable_token.should_not == ""
    end
  end

  describe "GET edit" do
    it "should not load correctly if the token is invalid" do
      get "edit", :id => "invalidtoken"
      response.should_not be_success
      response.should redirect_to :controller => :home, :action => :index
    end

    it "should load correctly if the token is valid" do
      get "edit", :id => @user.perishable_token
      response.should be_success
      response.should render_template :edit
    end
  end

  describe "POST update" do
    it "should not load correctly if the token is invalid" do
      post "update", :id => "invalidtoken", :user => {:password => "test", :password_confirmation => "test"}
      response.should_not be_success
      response.should redirect_to :controller => :home, :action => :index
    end

    it "should fail if password doesn't match confirmation" do
      post "update", :id => @user.perishable_token, :user => {:password => "test", :password_confirmation => "somethingelse"}
      response.should_not redirect_to :controller => :portfolios, :action => :show, :id => @user.portfolio.id
      response.should render_template :edit
    end

    it "should reset password if passwords match" do
      post "update", :id => @user.perishable_token, :user => {:password => "test", :password_confirmation => "test"}
      response.should redirect_to :controller => :portfolios, :action => :show, :id => @user.portfolio.id
    end
  end

end
