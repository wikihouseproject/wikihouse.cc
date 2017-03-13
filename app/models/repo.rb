class Repo < ApplicationRecord

  belongs_to :technology, required: false

  def self.with_data
    where.not(data: nil)
  end

  def self.total_watchers
    with_data.map {|r| r.data['info']['watchers_count'] }.sum
  end

  def self.total_filecount
    with_data.map {|r| r.data['filecount'] }.sum
  end

  def self.total_commits
    Repo.sum(:commits_count)
  end

  def self.get(owner, name)
    find_or_create_by(owner: owner, name: name)
  end

  def url
    "https://github.com/#{full_name}"
  end

  def full_name
    "#{owner}/#{name}"
  end

  def issues_url
    "#{url}/issues"
  end

  def archive_url
    "#{url}/archive/master.zip"
  end

  def git_hub_project
    GitHubProject.new(self)
  end

  def refresh
    project = git_hub_project

    update!(
      data:          project.data,
      commits_count: project.commits_count
    )
  end

  def data
    super || {}
  end

  def description
    data.dig("info", "description")
  end

  def readme
    data["readme"]
  end

  def files
    Array(data["files"])
  end

end
