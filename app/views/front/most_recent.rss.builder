xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title @portfolio.title
    xml.description @portfolio.description
    xml.link "http://ffocused.com/#{@portfolio.slug}"

    for photo in @photos
      xml.item do
        xml.title photo.title
        xml.description do
          xml << h(render(:partial => 'photo', :locals => {:photo => photo}))
        end
        xml.pubDate photo.created_at.to_s(:rfc822)
        xml.link single_photo_url(:slug => @portfolio.slug, :category_slug => photo.category.slug, :photo_id => photo.id)
      end
    end
  end
end
