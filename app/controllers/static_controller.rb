require 'ostruct'

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
    @medium_post = OpenStruct.new({
      img: "https://static.wikihouse.cc/MiniWiki-v1.1.jpg",
      title: "New year, new website.",
      url: "https://medium.com/@WikiHouse/new-year-new-website-bcb1dd233bbe",
      background_css: "background-color: #1C2229; background-size: cover; background-position: 83% center;"
    })
  end

  def about_wikihouse_foundation
    @team_members = TeamMember.all # (not an ActiveRecord model)
  end

  def landing
    @sliders = sliders_for(HomePage)
  end

  def propose_a_pilot
    @sliders = sliders_for(PilotsPage)
  end

  private

  def sliders_for(page)
    Slider.with_parent_type(page)
          .sorted
          .published
          .map { |s| SliderPresenter.new(s, view_context) }
  end
end
