describe "spec_helper"

describe User do
  before(:each) do
    @user = User.new(:login => "marcgg", :email => "marc@ffocused.com", :password => "abcde", :password_confirmation => "abcde")
  end

  it "should not be created without a beta code" do
    @user.should_not be_valid
    @user.beta_code = BetaCode.create(:code => "kdo").code
    @user.should be_valid
  end

  it "should burn the beta code each time" do
    betacode = BetaCode.create(:code => "kdo")
    betacode.used.should be_false
    @user.beta_code = betacode.code
    @user.save!
    betacode.reload
    betacode.used.should be_true
  end

  context "with a setup user" do
    before(:each) do
      @user.beta_code = BetaCode.create(:code => "kdo").code
    end

    it "should setup a portfolio" do
      @user.portfolio.should be_nil
      @user.save!
      @user.reload
      @user.portfolio.should_not be_nil
    end

    it "should be findable by email or login" do
      @user.save
      User.find_by_login_or_email("marcgg").should == @user
      User.find_by_login_or_email("marc@ffocused.com").should == @user
    end
  end
end
