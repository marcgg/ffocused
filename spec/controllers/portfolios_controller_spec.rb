require "spec_helper"

describe PortfoliosController do

  before(:each) do
    @user = Fabricate(:user)
    @portfolio = @user.portfolio
    use_application_as(@user, :setup_portfolio => true)
  end

  describe "GET not_setup" do
    it "should load correctly" do
      get 'not_setup', :id => @user.portfolio.id
      response.should be_success
      response.should render_template :not_setup
    end
  end

  describe "GET edit" do
    it "should load correctly" do
      get 'edit', :id => @user.portfolio.id
      response.should be_success
      response.should render_template :edit
    end
  end

  describe "GET show" do
    it "should load correctly" do
      get 'show', :id => @user.portfolio.id
      response.should be_success
      response.should render_template :show
    end
  end

  describe "POST order_categories" do
    it "should reorder categories" do
      category = Fabricate(:category, :remote_account => @portfolio.remote_accounts.first, :portfolio => @portfolio, :position => 0)
      other_category = Fabricate(:category, :remote_account => @portfolio.remote_accounts.first, :portfolio => @portfolio, :position => 1)
      post "order_categories", :id => @user.portfolio.id, :item_ids => [other_category.id, category.id]
      category.reload and other_category.reload
      category.position.should == 1
      other_category.position.should == 0
      response.should be_success
    end
  end

  describe "PUT update" do
    it "should work" do
      put "update", :id => @portfolio.id, :portfolio => {:slug => "mynewslug"}
      @portfolio.reload
      @portfolio.slug.should == "mynewslug"
      response.should redirect_to portfolio_path(@portfolio)
    end

    it "should fail gracefully" do
      # FIXME: Doesn't seem to reach
      put "update", :id => @portfolio.id, :portfolio => {:title => "admin"}
      @portfolio.reload
      @portfolio.slug.should_not == "admin"
      response.should redirect_to portfolio_path(@portfolio)
    end
  end

end
