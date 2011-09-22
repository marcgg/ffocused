require "spec_helper"

describe Photo do
  it "should mark photos as destroyed and then scope it" do
    photo = Photo.create
    Photo.activated.should == [photo]
    photo.mark_as_destroyed
    Photo.activated.should be_empty
  end
end
