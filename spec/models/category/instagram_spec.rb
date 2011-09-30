require "spec_helper"

describe Category::Instagram do
  before(:each) do
    @category = Category::Instagram.new(:title => "instagram!")
    @account = RemoteAccount::InstagramAccount.new
    @category.remote_account = @account
  end

  it "should set_photos_from_instagram on creation" do
    mock(@category).set_photos_from_instagram
    @category.save!
  end

  it "should set_photos_from_instagram on refresh" do
    mock(@category).set_photos_from_instagram
    @category.refresh
  end


  describe "set_photos_from_instagram" do
    it "should use the photos from the remote account and map them to the database" do
      mock(@account).photos{
        [
          {
            "images" => {
              "standard_resolution" => {"url" => "standard_url"},
              "thumbnail" => {"url" => "thumb_url"}
            },
            "filter" => "Awesome Filter",
            "created_time" => "1316976068"
          }
        ]
      }
      Photo.count.should == 0
      @category.save
      Photo.count.should == 1
      @category.photos.size.should == 1
      Photo.first.large_photo_url.should == "standard_url"
      Photo.first.position.should == 0
      Photo.first.small_photo_url.should == "thumb_url"
      Photo.first.description.should == "Awesome Filter"
      Photo.first.title.should == "09/25/2011"
    end
  end
end
