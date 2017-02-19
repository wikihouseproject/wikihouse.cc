require 'rails_helper'

describe "static" do

  it "has a homepage" do
    visit "/"
    expect(page).to have_title "WikiHouse"
  end

  [ 'About', 'Library', 'R&D', 'Partners',
    'Propose a pilot', 'About WikiHouse Foundation',
    ['Contact Us', 'Becoming a partner'], 'Jobs', 'Donate'].each do |link|

    if link.kind_of?(Array)
      link = link[0]
      title = link[1]
    end

    it "has a '#{link}' page" do
      visit "/"
      click_link(link, match: :first)
      expect(page).to have_title(title||link)
    end

  end

end
