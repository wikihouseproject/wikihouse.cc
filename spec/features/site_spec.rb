require 'rails_helper'

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

  def self.has_page(link_name, **opts)
    it "has a '#{link_name}' page" do
      visit "/"
      expect_page link_name, **opts
    end
  end

  def expect_page(link_name, title: link_name)
    click_link(link_name, match: :first)
    expect(page).to have_title(title)
  end

  it "has a home page" do
    visit "/"
    expect(page).to have_title("WikiHouse")
  end

  it "has a library" do
    visit "/"

    expect_page "Library"
    expect_page "Types"
    expect_page "Microhouse"
  end

  it "has a technologies library" do
    visit "/"

    expect_page "Library"
    expect_page "Technologies"
    expect_page "Structure"
    expect_page "Wren"
  end

  has_page "About"
  has_page "R&D"
  has_page "Partners"
  has_page "Propose a pilot"
  has_page "About WikiHouse Foundation"
  has_page "Contact Us", title: "Becoming a partner"
  has_page "Jobs"
  has_page "Donate"

end
