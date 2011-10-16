require "spec_helper"

describe Category do
  before(:each) do
    @category = Category.create! :title => "Yeah"
  end

  it "should be able to reset" do
    @category.photos << Photo.new
    @category.photos << Photo.new
    Photo.count.should == 2
    mock(@category).refresh
    @category.reset
  end

  it "should create a slug on creation" do
    @category.slug.should == @category.generated_slug
  end

  it "should generate a slug" do
    @category.generated_slug.should == "#{@category.id}-yeah"
  end

  it "should not set a slug on creation if one is given" do
    category = Category.create :title => "Bonjour", :slug => "hello"
    category.slug.should == "hello"
  end

  describe "update_stats" do
    it "should be able to update stats" do
      photo = Photo.create
      other_photo = Photo.create
      photo.prints.should == 0
      other_photo.prints.should == 0
      @category.photos = [photo, other_photo]
      @category.save
      @category.update_stats
      photo.reload and other_photo.reload
      photo.prints.should == 1
      other_photo.prints.should == 1
    end

    it "should not update stats of photos outside scope" do
      photos = []
      20.times do |i|
        photos << Photo.create(:position => i)
      end
      @category.photos = photos
      @category.save
      @category.update_stats
      photos.each{|p| p.reload}
      photos.last.prints.should == 0
      photos.first.prints.should == 1
    end
  end
end

