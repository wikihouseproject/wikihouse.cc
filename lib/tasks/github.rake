require 'nokogiri'
require 'open-uri'
require 'json'

namespace :github do

  def get_readme(user, project)
    url = "https://raw.githubusercontent.com/#{user}/#{project}/master/README.md"
    open(url).read
  end

  def scrape user, project, delay=0
    repo = Repo.find_or_create_by(name: project, owner: user)
    url = "https://github.com/#{user}/#{project}"
    doc = Nokogiri::HTML(open(url))
    h = {
      watchers: doc.css('a.social-count')[0].text.strip.to_i,
      stars: doc.css('a.social-count')[1].text.strip.to_i,
      forks: doc.css('a.social-count')[2].text.strip.to_i,
      readme: get_readme(user, project).strip,
      files: []
    }

    begin
      h[:updated_at] = doc.css('span[itemprop=dateModified] relative-time')[0].attr('datetime').strip
    rescue
    end

    begin
      h[:commits_count] = doc.css('div.overall-summary li.commits span.num')[0].text.to_i
      repo.commits_count = h[:commits_count]
    rescue
    end

    doc.css('table.files tr').each do |file|
      begin
        h[:files] << {
          name: file.css('a.js-navigation-open').text.strip,
          updated_at: file.css('time-ago').attr('datetime').value.strip
        }
      rescue
      end
    end
    repo.data = h

    sleep(delay)

    url = "https://api.github.com/repos/#{user}/#{project}/contents"
    data = JSON.parse(open(url).read)
    h[:filecount] = data.length

    sleep(delay)

    url = "https://api.github.com/repos/#{user}/#{project}"
    data = JSON.parse(open(url).read)
    h[:info] = data

    repo.save!

    sleep(delay)
  end

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
      scrape('wikihouseproject', project, 0.3)
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
