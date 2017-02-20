require 'nokogiri'
require 'open-uri'
require 'json'

class GitHubScraper
  attr_reader :user, :project, :delay

  def initialize(user, project, delay = 0)
    @user    = user
    @project = project
    @delay   = delay
  end

  def get_readme
    url = "https://raw.githubusercontent.com/#{user}/#{project}/master/README.md"
    open(url).read
  end

  def scrape
    repo = Repo.find_or_create_by(name: project, owner: user)
    url = "https://github.com/#{user}/#{project}"
    doc = Nokogiri::HTML(open(url))
    h = {
      watchers: doc.css('a.social-count')[0].text.strip.to_i,
      stars: doc.css('a.social-count')[1].text.strip.to_i,
      forks: doc.css('a.social-count')[2].text.strip.to_i,
      readme: get_readme.strip,
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
end
