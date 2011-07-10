namespace :rlvnt do  
  desc "Simple display of DB content"
  task :show_base => :environment do
    puts "========= USERS"
    puts User.all.to_yaml
    puts "\n========= PORTFOLIOS"
    puts Portfolio.all.to_yaml
  end
  
  desc "Set some people as admins"
  task :set_me_as_admin => :environment do
    puts "Setting marcgg & kevintunc as admin"
    User.first(:conditions => {:login => "marcgg"}).update_attribute(:is_admin, true)
    User.first(:conditions => {:login => "kevintunc"}).update_attribute(:is_admin, true)
  end
  
  desc "Getting ready for Heroku"
  task :heroku_vars => :environment do
    puts "Reference here: http://devcenter.heroku.com/articles/config-vars"
    puts "heroku config:add INSTAGRAM_CALLBACK_URL=#{INSTAGRAM_CALLBACK_URL} INSTAGRAM_CLIENT_SECRET=#{INSTAGRAM_CLIENT_SECRET} INSTAGRAM_CLIENT_ID=#{INSTAGRAM_CLIENT_ID} FACEBOOK_CALLBACK_URL=#{FACEBOOK_CALLBACK_URL} FACEBOOK_APPLICATION_API_KEY=#{FACEBOOK_APPLICATION_API_KEY} FACEBOOK_APPLICATION_SECRET=#{FACEBOOK_APPLICATION_SECRET} FACEBOOK_APPLICATION_ID=#{FACEBOOK_APPLICATION_ID} FLICKR_APPLICATION_API_KEY=#{FLICKR_APPLICATION_API_KEY} FLICKR_APPLICATION_SECRET=#{FLICKR_APPLICATION_SECRET}"
  end
end
