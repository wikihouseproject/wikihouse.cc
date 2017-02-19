require 'nokogiri'
require 'open-uri'
require 'json'

namespace :import do

  task technologies: :environment do
    JSON.parse(open('data/technologies.json').read).each_with_index do |technology, index|
      Technology.find_or_initialize_by(name: technology['name']).tap do |p|
        p.ordinal = index
        p.color = technology['color']
        p.icon = technology['icon']
        p.save!
      end
    end
  end

  task about_points: :environment do
    JSON.parse(open('data/about.json').read).each_with_index do |point, index|
      AboutPoint.find_or_initialize_by(name: point['title']).tap do |ap|
        ap.ordinal = index
        ap.description = point['description']
        ap.save!
      end
    end
  end

end
