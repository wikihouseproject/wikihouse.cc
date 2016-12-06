require 'nokogiri'
require 'open-uri'
require 'json'
require 'hashie'

namespace :github do

  def get_readme(user, project)
    url = "https://raw.githubusercontent.com/#{user}/#{project}/master/README.md"
    open(url).read
  end

  task :get_filelist do
    user = 'wikihouseproject'
    project = 'Microhouse'
    url = "https://api.github.com/repos/#{user}/#{project}/contents/"
    p JSON.parse(open(url).read).map{|f| f['name']}
  end

  task scrape_repo: :environment do
    user = 'wikihouseproject'
    project = 'Microhouse'
    repo = Repo.find_or_create_by(name: project, owner: user)
    url = "https://github.com/#{user}/#{project}"
    doc = Nokogiri::HTML(open(url))
    h = {
      watchers: doc.css('a.social-count')[0].text.strip.to_i,
      stars: doc.css('a.social-count')[1].text.strip.to_i,
      forks: doc.css('a.social-count')[2].text.strip.to_i,
      readme: get_readme(user, project).strip,
      updated_at: doc.css('span[itemprop=dateModified] relative-time')[0].attr('datetime').strip,
      files: []
    }
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
    repo.save!
  end
  
  task :scrape do
  end

end
