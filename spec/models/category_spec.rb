require "spec_helper"

describe Category do
  before(:each) do
    @category = Category.create :title => "Yeah"
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

end

