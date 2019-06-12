namespace :fixproduction do
  desc "TODO"
  task friendlyurl: :environment do
    puts "-- friendly_id seed --"
    Post.find_each(&:save)
    Category.find_each(&:save)
    Course.find_each(&:save)
    puts "-- friendly_id seed - END --"
  end

end
