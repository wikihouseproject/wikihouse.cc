require "octokit"

class GitHubProject
  attr_reader :github, :repo

  def initialize(repo)
    @github = Octokit::Client.new(access_token: ENV.fetch("git_hub_token"))
    @repo   = github.repository("#{repo.owner}/#{repo.name}")
  end

  def repo_name
    repo.full_name
  end

  def contributors
    github.contributors(repo_name)
  end

  def readme_contents
    github.readme(repo_name, accept: "application/vnd.github.v3.raw")
          .force_encoding("utf-8")
          .strip
  end

  def tree
    @tree ||= github.tree(repo_name, "master").tree
  end

  def to_h
    data = self.data

    {
      data:          data,
      commits_count: data[:commits_count], # FIXME: it's confusing to store this in two places
    }
  end

  def data
    {
      watchers:      repo.subscribers_count, # This is not the same as what GH considers "watchers"
      stars:         repo.stargazers_count,
      forks:         repo.forks_count,
      readme:        readme_contents,
      updated_at:    repo.pushed_at,
      commits_count: contributors.sum(&:contributions),
      files:         tree.map { |file| file_data(file) },
      filecount:     tree.count,
      info:          repo.to_h.deep_stringify_keys,
    }
  end

  private

  def file_data(file)
    {
      name:       file.path,
      updated_at: latest_commit(file.path).commit.committer.date,
    }
  end

  def latest_commit(path)
    github.commits(repo_name, path: path, per_page: 1).first
  end
end
