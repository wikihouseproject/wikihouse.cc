require "rails_helper"
require "git_hub_scraper"

RSpec.describe GitHubProject, :vcr do
  let(:repo) { Repo.find_or_create_by(owner: "wikihouseproject", name: "Wren") }

  it "pulls data about the repository" do
    attributes = GitHubProject.new(repo).to_h
    data       = JSON.parse(attributes[:data].to_json)

    expect(attributes[:commits_count]).to be > 0
    expect(data["readme"]).not_to be_blank
    expect(data["files"]).not_to be_empty
    expect(Time.parse(data.dig("files", 0, "updated_at"))).not_to be_nil
  end
end
