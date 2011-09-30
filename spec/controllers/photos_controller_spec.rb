require "spec_helper"

describe PhotosController do
  before(:each) do
    @user = Fabricate(:user)
    @category = Fabricate(:category, :portfolio => @user.portfolio, :remote_account => @user.portfolio.remote_accounts.first)
    @photo = Fabricate(:photo, :category => @category)
    use_application_as(@user, :setup_portfolio => true)
  end

  describe "GET edit" do
    it "should load correctly" do
      get 'edit', :category_id => @category.id, :id => @photo.id
      response.should be_success
      response.should render_template :edit
      assigns(:category).should == @category
      assigns(:photo).should == @photo
    end
  end

  describe "PUT update" do
    it "should update correctly and redirect" do
      put "update", :category_id => @category.id, :id => @photo.id, :photo => {:title => "Cute Cats"}
      @photo.reload
      @photo.title.should == "Cute Cats"
      response.should redirect_to category_path(@category)
      assigns(:category).should == @category
      assigns(:photo).should == @photo
    end
  end

  describe "DELETE desrtoy" do
    it "should mark the photo as destroyed" do
      delete "destroy", :category_id => @category.id, :id => @photo.id
      response.should be_success
      @photo.reload
      @photo.should be_deleted
      assigns(:category).should == @category
      assigns(:photo).should == @photo
    end
  end
end

