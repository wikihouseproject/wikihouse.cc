require "octokit"

class GitHubProject
  attr_reader :github, :repo

  def initialize(repo)
    @github = Octokit::Client.new(access_token: ENV["git_hub_token"])

    begin
      @repo = github.repository("#{repo.owner}/#{repo.name}")
    rescue Octokit::NotFound, Octokit::InvalidRepository
      @repo = nil
    end
  end

  def exists?
    repo
  end

  def repo_name
    repo.full_name
  end

  # Notes:
  #
  #   * This will break if the number of contributors gets so high that
  #     pagination kicks in, but (probably) YAGNI
  #
  #   * The second boolean parameter allows us to opt-in to counting anonymous
  #     contributors, without which we'll come out with a different commit count
  #     to what appears on GitHub
  def contributors
    github.contributors(repo_name, true)
  end

  def readme_contents
    github.readme(repo_name, accept: "application/vnd.github.v3.raw")
          .force_encoding("utf-8")
          .strip
  end

  def tree
    @tree ||= github.tree(repo_name, "master").tree
  end

  def commits_count
    contributors.sum(&:contributions)
  end

  def data
    {
      watchers:      repo.subscribers_count, # This is not the same as what GH considers "watchers"
      stars:         repo.stargazers_count,
      forks:         repo.forks_count,
      readme:        readme_contents,
      updated_at:    repo.pushed_at,
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
