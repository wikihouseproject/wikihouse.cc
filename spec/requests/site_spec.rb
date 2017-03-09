require "rails_helper"

# Workaround for https://github.com/pushtype/push_type/pull/37
Rails.root.join("app/presenters").children.each { |c| require_dependency c }

describe Wikihouse do

  before(:context) do
    CMSBuilder.new.build
  end

  after(:context) do
    PushType::Node.delete_all
    PushType::Asset.delete_all
  end

  def self.renders_page(path, title)
    it "renders '#{path}' with title '#{title}'" do
      expect_title path, title
    end
  end

  def expect_title(url, title)
    get url
    follow_redirect! if response.redirect?
    expect(response).to have_http_status(:success)
    assert_select "title", /#{title}/
  end

  renders_page "/", "WikiHouse"

  renders_page "/library", "Library"
  renders_page "/library/types", "Types"
  renders_page "/library/types/microhouse", "Microhouse"
  renders_page "/library/technologies", "Technologies"
  renders_page "/library/technologies/structure", "Structure"
  renders_page "/library/technologies/structure/wren", "Wren"

  renders_page "/about", "About"
  renders_page "/community", "R&D"
  renders_page "/partners", "Partners"
  renders_page "/about-wikihouse-foundation", "About WikiHouse Foundation"
  renders_page "/contact-us", "Becoming a partner"
  renders_page "/jobs", "Jobs"
  renders_page "/donate", "Donate"

  it "redirects old library URLs" do
    ["/library/types/Microhouse", "/library/technologies/structure/Wren"].each do |path|
      get path
      expect(response).to have_http_status(:redirect)
      expect(response.location).to end_with(path.downcase)
    end
  end

  it "shows a 404 page" do
    get "/foo"
    expect(response).to have_http_status(:not_found)
    expect(response.headers["Content-Type"]).to include("text/html")
    assert_select "title", /404/
  end

  it "pulls repo data when new library items are added" do
    item = LibraryItem.create!(
      parent:   LibraryCategory.first,
      title:    "Foo",
      slug:     "foo",
      image_id: PushType::Asset.first.id,
      status:   PushType::Node.statuses[:published],
    )
    repo = item.repo

    # Ensure page renders even though repo data not yet pulled
    expect_title node_path(item.permalink), "Foo"

    allow(Repo).to receive(:find).with(repo.id).and_return(repo)
    expect(repo).to receive(:refresh)

    Delayed::Worker.new.work_off
  end

end
