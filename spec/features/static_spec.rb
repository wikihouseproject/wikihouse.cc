require 'rails_helper'

describe "static" do

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
