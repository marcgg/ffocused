require "spec_helper"

describe Category::Facebook do
  before(:each) do
    @category = Category::Facebook.new(:title => "Cats", :facebook_album_id => 4)
    @account = RemoteAccount.new(:access_token => "token")
    @category.remote_account = @account
  end

  it "should set photos after creation" do
    mock(@category).set_photos_from_facebook
    @category.save!
  end

  describe "refresh" do
    it "should simply set photos from facebook" do
      mock(@category).set_photos_from_facebook
      @category.refresh
    end
  end

  describe "set_photos_from_facebook" do
    it "should fetch photos on facebook and then save them" do
      fake_koala = Object.new
      mock(Koala::Facebook::GraphAPI).new("token"){fake_koala}
      mock(fake_koala).get_connections(4, "photos", :fields => "id,name,images", :limit => 200){[
        {"id" => 1, "images" => [{"source" => "large_source"}, {"source" => "small_source"}], "name" => "Photo 1"},
        {"id" => 2, "images" => [{"source" => "large_source"}, {"source" => "small_source"}], "name" => "Photo 2"}
      ]}
      Photo.count.should == 0
      @category.save!
      Photo.count.should == 2
      @category.photos.size.should == 2
      Photo.first.facebook_photo_id.should == "1"
      Photo.first.large_photo_url.should == "large_source"
      Photo.first.small_photo_url.should == "small_source"
      Photo.first.description.should == "Photo 1"
      Photo.first.title.should == "Photo 1"
      Photo.first.position.should == 0

      Photo.last.facebook_photo_id.should == "2"
      Photo.last.large_photo_url.should == "large_source"
      Photo.last.small_photo_url.should == "small_source"
      Photo.last.description.should == "Photo 2"
      Photo.last.title.should == "Photo 2"
      Photo.last.position.should == 1
    end
  end

end
