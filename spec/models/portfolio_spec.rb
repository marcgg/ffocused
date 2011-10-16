require "spec_helper"

describe Portfolio do
  before(:each) do
    @user = Object.new
    stub(@user).login{"marcgg"}
    @portfolio = Portfolio.new
    stub(@portfolio).user{@user}
    @portfolio.save
  end

  it "should set a default css theme" do
    @portfolio.theme_id.should == 1
  end

  it "should set a default slug based on the user's login" do
    @portfolio.slug.should == "marcgg"
  end

  it "should return a theme based on the theme_id and the theme list" do
    @portfolio.theme_id = 1
    @portfolio.theme.should == THEMES[1]
  end

  it "should be setup once it has a remote account" do
    @portfolio.should_not be_setup
    mock(@portfolio).remote_accounts{[RemoteAccount.new]}
    @portfolio.should be_setup
  end

  describe "contextual_photo" do
    before(:each) do
      @category = Category.create :title => "Yeah", :portfolio_id => @portfolio.id
      @category.photos << Photo.new
      @category.photos << Photo.new
    end

    it "should return the given category's first photo" do
      @portfolio.contextual_photo(@category).should == @category.photos.first
    end

    it "should return the first category's first photo if no category is passed" do
      @portfolio.contextual_photo.should == @category.photos.first
    end

    it "should return nil if the portfolio has no category" do
      Category.delete_all
      @portfolio.contextual_photo.should == nil
    end
  end

end
