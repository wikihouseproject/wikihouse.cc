require 'rails_helper'

# Workaround for https://github.com/pushtype/push_type/pull/37
HomePagePresenter
PilotsPagePresenter

describe Wikihouse do

  before(:context) do
    CMSBuilder.new.build
  end

  after(:context) do
    PushType::Node.delete_all
    PushType::Asset.delete_all
  end

  def self.has_page(link_name, title: link_name)
    it "has a '#{link_name}' page" do
      visit "/"
      click_link(link_name, match: :first)
      expect(page).to have_title(title)
    end
  end

  it "has a home page" do
    visit "/"
    expect(page).to have_title("WikiHouse")
  end

  has_page "About"
  has_page "Library"
  has_page "R&D"
  has_page "Partners"
  has_page "Propose a pilot"
  has_page "About WikiHouse Foundation"
  has_page "Contact Us", title: "Becoming a partner"
  has_page "Jobs"
  has_page "Donate"

end
