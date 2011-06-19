namespace :rlvnt do  
  task :show_base => :environment do
    puts "========= USERS"
    puts User.all.to_yaml
    puts "\n========= PORTFOLIOS"
    puts Portfolio.all.to_yaml
  end
  
  task :set_me_as_admin => :environment do
    puts "Setting marcgg & kevintunc as admin"
    User.first(:conditions => {:login => "marcgg"}).update_attribute(:is_admin, true)
    User.first(:conditions => {:login => "kevintunc"}).update_attribute(:is_admin, true)
  end
end