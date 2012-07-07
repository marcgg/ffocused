require "spec_helper"

describe Mailer do

  before(:each) do
    @user = Fabricate(:user)
    @host = "ffocused.com"
  end

  describe "forgotten_password_instructions" do
    it "send user password reset url" do
      mail = Mailer.forgotten_password_instructions(@user)
      mail.subject.should == I18n.t("forgotten_password.email.subject")
      mail.to.should == [@user.email]
      mail.from.should == ["notifications@ffocused.com"]
      mail.body.encoded.should match(edit_forgotten_password_url(@user.perishable_token, :host => @host))
    end
  end
end
