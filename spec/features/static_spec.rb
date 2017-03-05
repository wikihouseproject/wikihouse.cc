require 'rails_helper'

# Workaround for https://github.com/pushtype/push_type/pull/37
HomePagePresenter
PilotsPagePresenter

describe "static" do

  fixtures :all

  def self.has_page(link_name, title: link_name, cms: false)
    it "has a '#{link_name}' page" do
      visit "/"
      click_link(link_name, match: :first)
      expect(page).to have_title(title)
    end

    if cms
      it "has a '#{link_name}' page (CMS enabled)" do
        visit "/"
        click_link(link_name, match: :first)
        visit current_url + "?cms=1"
        expect(page).to have_title(title)
      end
    end
  end

  it "has a home page" do
    visit "/"
    expect(page).to have_title("WikiHouse")
  end

  it "has a home page (CMS enabled)" do
    visit "/?cms=1"
    expect(page).to have_title("WikiHouse")
  end

  has_page "About"
  has_page "Library"
  has_page "R&D"
  has_page "Partners", cms: true
  has_page "Propose a pilot", cms: true
  has_page "About WikiHouse Foundation", cms: true
  has_page "Contact Us", title: "Becoming a partner"
  has_page "Jobs"
  has_page "Donate"

end
