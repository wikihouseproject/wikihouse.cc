namespace :github do
  task refresh_all: :environment do
    Repo.pluck(:owner, :name).each do |owner, project|
      print "Refreshing GitHub data for #{owner}/#{project}... "
      Repo.get(owner, project).refresh
      puts "done"
      $stdout.flush
    end
  end
end
