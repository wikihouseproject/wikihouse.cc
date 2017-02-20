require "rails_helper"
require "git_hub_scraper"

RSpec.describe GitHubProject do
  it "does the same thing as GitHubScraper" do
    repo = Repo.find_or_create_by(owner: "wikihouseproject", name: "Wren")
    repo2 = Repo.find(repo.id)

    expect(repo.data).to be_blank

    GitHubScraper.new("wikihouseproject", "Wren").scrape
    expect(repo.reload.data).not_to be_empty

    repo2.attributes = GitHubProject.new(repo2).to_h

    expect(repo2.attributes.except("updated_at")).to eq(repo.attributes.except("updated_at"))
  end
end
