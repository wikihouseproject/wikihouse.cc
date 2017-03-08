require "rails_helper"

RSpec.describe Repo do
  describe "#refresh" do
    it "pulls data about the repository from GitHub", :vcr do
      repo = Repo.get("wikihouseproject", "Wren")
      expect(repo.data).to be_blank

      repo.refresh

      expect(repo.commits_count).to be > 0
      expect(repo.data["readme"]).not_to be_blank
      expect(repo.data["files"]).not_to be_empty
      expect(Time.parse(repo.data.dig("files", 0, "updated_at"))).not_to be_nil
      expect(repo.description).not_to be_blank
    end
  end

  describe "a new repo" do
    it "has empty data" do
      expect(subject.data).to eq({})
    end

    it "has no description" do
      expect(subject.description).to eq(nil)
    end
  end
end
