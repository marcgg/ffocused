require "spec_helper"

describe CategoriesController do
  before(:each) do
    @user = Fabricate(:user)
    @remote_account = Fabricate(:remote_account)
    @category = Fabricate(:category, :portfolio => @user.portfolio, :remote_account => @remote_account)
    use_application_as(@user, :setup_portfolio => true)
  end

  describe "GET index" do
    it "should load the list of categories" do
      get "index"
      response.should be_success
      response.should render_template :index
      assigns(:categories).should == [@category]
      assigns(:remote_accounts).should == @user.portfolio.remote_accounts
    end
  end

  describe "GET edit" do
    it "should render correctly" do
      get "edit", :id => @category.id
      response.should render_template :edit
      assigns(:category).should == @category
    end
  end

  describe "DELETE destroy" do
    it "should destroy a category" do
      Category.count.should == 1
      delete "destroy", :id => @category.id
      Category.count.should == 0
    end
  end

  describe "GET show" do
    it "should load correctly" do
      get "show", :id => @category.id
      response.should render_template :show
      assigns(:category).should == @category
    end
  end
end
