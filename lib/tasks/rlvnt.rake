namespace :rlvnt do  
  task :show_base => :environment do
    puts "========= USERS"
    puts User.all.to_yaml
    puts "\n========= PORTFOLIOS"
    puts Portfolio.all.to_yaml
  end
  
  task :set_all_as_admin => :environment do
    puts "Setting every #{User.count} users as admin"
    User.all.each do |user|
      puts "User #{user.email} is now admin"
      user.update_attribute(:is_admin, true)
    end
  end
end