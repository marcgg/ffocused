namespace :ffocused do
  desc "Set some people as admins"
  task :set_me_as_admin => :environment do
    puts "Setting marcgg & kevintunc as admin"
    User.first(:conditions => {:login => "marcgg"}).update_attribute(:is_admin, true)
    User.first(:conditions => {:login => "kevintunc"}).update_attribute(:is_admin, true) unless User.count == 1 # Local dev
  end

  desc "Helper to set Heroku variables"
  task :heroku_vars => :environment do
    puts "Reference here: http://devcenter.heroku.com/articles/config-vars"
    puts "heroku config:add INSTAGRAM_CALLBACK_URL=#{INSTAGRAM_CALLBACK_URL} INSTAGRAM_CLIENT_SECRET=#{INSTAGRAM_CLIENT_SECRET} INSTAGRAM_CLIENT_ID=#{INSTAGRAM_CLIENT_ID} FACEBOOK_CALLBACK_URL=#{FACEBOOK_CALLBACK_URL} FACEBOOK_APPLICATION_API_KEY=#{FACEBOOK_APPLICATION_API_KEY} FACEBOOK_APPLICATION_SECRET=#{FACEBOOK_APPLICATION_SECRET} FACEBOOK_APPLICATION_ID=#{FACEBOOK_APPLICATION_ID} FLICKR_APPLICATION_API_KEY=#{FLICKR_APPLICATION_API_KEY} FLICKR_APPLICATION_SECRET=#{FLICKR_APPLICATION_SECRET}"
  end

  desc "Set all photos as not deleted"
  task :set_all_as_activated => :environment do
    Photo.update_all("deleted=true")
  end
end
