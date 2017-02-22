namespace :github do
  task refresh_all: :environment do
    Repo.all.each do |repo|
      print "Refreshing GitHub data for #{repo.full_name}... "
      repo.refresh
      puts "done"
      $stdout.flush
    end
  end
end
