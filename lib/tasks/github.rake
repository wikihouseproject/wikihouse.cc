namespace :github do
  task refresh_all: :environment do
    %w(Wren StepUp Mallet Microhouse Owl).each do |project|
      print "Refreshing GitHub data for #{project}... "
      Repo.get("wikihouseproject", project).refresh
      puts "done"
      $stdout.flush
    end
  end
end
