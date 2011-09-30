require "spec_helper"

describe Category::Flickr do
  before(:each) do
    @category = Category::Flickr.new(:title => "flickr", :flickr_set_id => "4")
    @account = RemoteAccount::Flickr.new(:access_token => "token")
    stub(@account).check_and_save_flickr_user_id
    @category.remote_account = @account
  end

  it "should call set_photos_from_flickr on refresh" do
    mock(@category).set_photos_from_flickr
    @category.refresh
  end

  it "should call set_photos_from_flickr on creation" do
    mock(@category).set_photos_from_flickr
    @category.save!
  end

  describe "set_photos_from_flickr" do
    it "should fetch photos and map them" do
      mock(Fetchers::Flickr::Request).call_method("photosets.getPhotos", {:photoset_id => "4", :per_page => "100"}){{"photoset" => {"photo" => "content"}}}
      mock(@category).map_photos("content")
      @category.set_photos_from_flickr
    end
  end

  describe "map_photos" do
    it "should correctly map a set of photos" do
      photos = [
        {"id" => "1", "title" => "Title 1"},
        {"id" => "2", "title" => "Title 2"}
      ]
      stub(@category).id{123}
      mock(@category).find_photo_sizes("1"){["large1", "small1"]}
      mock(@category).find_photo_sizes("2"){["large2", "small2"]}

      Photo.count.should == 0
      @category.map_photos(photos)
      Photo.count.should == 2

      first_photo = Photo.first
      first_photo.category_id.should == 123
      first_photo.flickr_photo_id.should == "1"
      first_photo.large_photo_url.should == "large1"
      first_photo.small_photo_url.should == "small1"
      first_photo.flickr_id.should == "1"
      first_photo.title.should == "Title 1"

      second_photo = Photo.last
      second_photo.category_id.should == 123
      second_photo.flickr_photo_id.should == "2"
      second_photo.large_photo_url.should == "large2"
      second_photo.small_photo_url.should == "small2"
      second_photo.flickr_id.should == "2"
      second_photo.title.should == "Title 2"
    end
  end

  describe "find_photo_sizes" do
    it "should find photo sizes based on a flickr photo id" do
      sizes = {"sizes"=>{"canblog"=>0, "canprint"=>0, "candownload"=>1, "size"=>[{"label"=>"Square", "width"=>75, "height"=>75, "source"=>"http://farm3.static.flickr.com/2507/3911379653_9b8f6aca98_s.jpg", "url"=>"http://www.flickr.com/photos/marcgg/3911379653/sizes/sq/", "media"=>"photo"}, {"label"=>"Thumbnail", "width"=>"66", "height"=>"100", "source"=>"http://farm3.static.flickr.com/2507/3911379653_9b8f6aca98_t.jpg", "url"=>"http://www.flickr.com/photos/marcgg/3911379653/sizes/t/", "media"=>"photo"}, {"label"=>"Small", "width"=>"159", "height"=>"240", "source"=>"http://farm3.static.flickr.com/2507/3911379653_9b8f6aca98_m.jpg", "url"=>"http://www.flickr.com/photos/marcgg/3911379653/sizes/s/", "media"=>"photo"}, {"label"=>"Medium", "width"=>"332", "height"=>"500", "source"=>"http://farm3.static.flickr.com/2507/3911379653_9b8f6aca98.jpg", "url"=>"http://www.flickr.com/photos/marcgg/3911379653/sizes/m/", "media"=>"photo"}, {"label"=>"Medium 640", "width"=>425, "height"=>"640", "source"=>"http://farm3.static.flickr.com/2507/3911379653_9b8f6aca98_z.jpg", "url"=>"http://www.flickr.com/photos/marcgg/3911379653/sizes/z/", "media"=>"photo"}, {"label"=>"Large", "width"=>"680", "height"=>"1024", "source"=>"http://farm3.static.flickr.com/2507/3911379653_9b8f6aca98_b.jpg", "url"=>"http://www.flickr.com/photos/marcgg/3911379653/sizes/l/", "media"=>"photo"}, {"label"=>"Original", "width"=>"2848", "height"=>"4288", "source"=>"http://farm3.static.flickr.com/2507/3911379653_03a0aff9bb_o.jpg", "url"=>"http://www.flickr.com/photos/marcgg/3911379653/sizes/o/", "media"=>"photo"}]}, "stat"=>"ok"}
      mock(Fetchers::Flickr::Request).call_method("photos.getSizes", {:photo_id => "4"}){sizes}
      res = @category.find_photo_sizes("4")
      res.should == ["http://farm3.static.flickr.com/2507/3911379653_9b8f6aca98_b.jpg", "http://farm3.static.flickr.com/2507/3911379653_9b8f6aca98_s.jpg"]
    end
  end
end
