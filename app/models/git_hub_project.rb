require 'nokogiri'
require 'open-uri'
require 'json'

class GitHubProject
  attr_reader :repo

  def initialize(repo)
    @repo = repo
  end

  def user
    repo.owner
  end

  def project
    repo.name
  end

  def to_h
    data = self.data

    {
      data:          data,
      commits_count: data[:commits_count], # FIXME: it's confusing to store this in two places
    }
  end

  def data
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

    url = "https://api.github.com/repos/#{user}/#{project}/contents"
    data = JSON.parse(open(url).read)
    h[:filecount] = data.length

    url = "https://api.github.com/repos/#{user}/#{project}"
    data = JSON.parse(open(url).read)
    h[:info] = data

    h
  end

  private

  def get_readme
    url = "https://raw.githubusercontent.com/#{user}/#{project}/master/README.md"
    open(url).read
  end
end
