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


end
