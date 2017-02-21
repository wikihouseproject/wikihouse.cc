require "rails_helper"
require "git_hub_scraper"

RSpec.describe GitHubProject do
  it "does the same thing as GitHubScraper", :vcr do
    repo = Repo.find_or_create_by(owner: "wikihouseproject", name: "Wren")
    repo2 = Repo.find(repo.id)

    expect(repo.data).to be_blank

    GitHubScraper.new("wikihouseproject", "Wren").scrape
    expect(repo.reload.data).not_to be_empty

    repo2.attributes = GitHubProject.new(repo2).to_h

    expected = repo.attributes.except("updated_at")
    actual   = repo2.attributes.except("updated_at")

    expect(actual).to eq(expected)
  end
end
