require 'open-uri'
require 'json'
require 'git_hub_scraper'

namespace :github do

  # def get_commit_counts user, project
  #   url = "https://api.github.com/repos/#{user}/#{project}/stats/contributors"
  #   json = JSON.parse(open(url).read)
  #   repo = Repo.find_or_create_by(name: project, owner: user)
  #   commits_count = json.map{|t| t['total'] }.sum
  #   if (commits_count > 0)
  #     repo.update_column(:commits_count, commits_count)
  #   end
  # end

  task scrape_all: :environment do
    %w(Wren StepUp Mallet Microhouse Owl).each do |project|
      puts "> Scraping #{project}"
      GitHubScraper.new('wikihouseproject', project, 0.3).scrape
      # get_commit_counts('wikihouseproject', project)
    end
  end

  task :get_filelist do
    user = 'wikihouseproject'
    project = 'Microhouse'
    url = "https://api.github.com/repos/#{user}/#{project}/contents/"
    p JSON.parse(open(url).read).map{|f| f['name']}
  end

end
