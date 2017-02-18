class StaticController < ApplicationController

  def nothing
    render nil, layout: 'application'
  end

  def donate
    # @names = 100.times.map{ Faker::Name.name }
  end

  def about
    @about_points = AboutPoint.order(ordinal: :asc)
  end

  def communities_guide
    render 'communities_guide', layout: false
  end

  def community
    @img = "https://static.wikihouse.cc/MiniWiki-v1.1.jpg"
    @title = "New year, new website."
    @url = "https://medium.com/@WikiHouse/new-year-new-website-bcb1dd233bbe"
    # "https://medium.com/@AlastairParvin/scaling-the-citizen-sector-20a20dbb7a4c"
    # x.at_xpath('//item//title').text
    # <%= x2.at_xpath('//img').attr('src') %>
    # x = File.open("data/alastairparvin.xml") { |f| Nokogiri::XML(f) } %>
    # x2 = Nokogiri::XML(x.at_xpath('//item//description')) %>
  end

end
