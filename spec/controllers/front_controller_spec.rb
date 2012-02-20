require "spec_helper"

describe FrontController do
  before(:each) do
    @user = Fabricate(:user)
    @portfolio = @user.portfolio
    @first_category = Fabricate(:category,
                                :portfolio => @user.portfolio,
                                :remote_account => @user.portfolio.remote_accounts.first,
                                :position => 0)
    @second_category = Fabricate(:category,
                                 :portfolio => @user.portfolio,
                                 :remote_account => @user.portfolio.remote_accounts.first,
                                 :position => 1)
    @photo = Fabricate(:photo, :category => @first_category)
  end

  describe "GET about" do
    it "should display the about page" do
      @portfolio.update_attributes(:about_page => true)
      get "about", :slug => @portfolio.slug
      response.should be_success
      response.should render_template :about
      assigns(:category).should be_nil
      assigns(:portfolio).should == @portfolio
    end

    it "should not display the about page if deactivated" do
      @portfolio.update_attributes(:about_page => false)
      get "about", :slug => @portfolio.slug
      response.should redirect_to root_path
    end
  end

  describe "GET showcase" do
    it "should display the default category" do
      get "showcase", :slug => @portfolio.slug
      response.should be_success
      response.should render_template :showcase
      assigns(:category).should == @first_category
      assigns(:portfolio).should == @portfolio
    end

    it "should update the category's stats" do
      @photo.prints.should == 0
      get "showcase", :slug => @portfolio.slug
      @photo.reload
      @photo.prints.should == 1
      response.should be_success
    end

    it "should load a given category" do
      get "showcase", :slug => @portfolio.slug, :category_slug => @second_category.slug
      response.should be_success
      assigns(:category).should == @second_category
    end

    it "should not fail if there are no categories" do
      Category.delete_all
      get "showcase", :slug => @portfolio.slug
      response.should be_success
    end
  end

  describe "GET single_photo" do
    it "should load a given photo" do
      get "single_photo", :slug => @portfolio.slug, :photo_id => @photo.id, :category_slug => @first_category.slug
      response.should be_success
      response.should render_template :single_photo
      assigns(:photo).should == @photo
    end

    it "should update stats for the photo" do
      @photo.prints.should == 0
      get "single_photo", :slug => @portfolio.slug, :photo_id => @photo.id, :category_slug => @first_category.slug
      @photo.reload
      @photo.prints.should == 1
      response.should be_success
    end
  end
end
